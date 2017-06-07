//
//  SQLManager.m
//  MyNameList
//
//  Created by zc on 2017/6/5.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "SQLManager.h"

@implementation SQLManager

#define kNameFile (@"Student.sqlite")

static SQLManager *manager = nil;

+ (SQLManager *)shareManager{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        manager = [[self alloc] init];
        [manager createDataBaseTableIfNeeded];
    });
    return manager;
}

// 获取数据库路径
- (NSString *)applicationDocumentsDirectoryFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths firstObject];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:kNameFile];
    return filePath;
}

// 创建数据库
- (void)createDataBaseTableIfNeeded {
    NSString *writetablePath = [self applicationDocumentsDirectoryFile];
    NSLog(@"数据库的地址是：%@",writetablePath);
    
    // 第一个参数是数据库文件所在的完整路径
    // 第二个参数是数据库 DataBase
    if(sqlite3_open([writetablePath UTF8String], &db) != SQLITE_OK){// SQLITE_OK 代表打开成功
        // 失败
        sqlite3_close(db);// 关闭数据库
        NSAssert(NO, @"数据库打开失败!");
    }else{
        char *err;
        NSString *createSQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS StudentName (idNum TEXT PRIMARY KEY,name TEXT);"];
        // 第一个参数是数据库 db对象
        // 第二个参数是SQL语句
        // 第三个和第四个分别是回调函数和回调函数传递的参数
        // 第五个参数是一个错误信息
        if(sqlite3_exec(db, [createSQL UTF8String], nil, nil, &err) != SQLITE_OK){
            // 失败
            sqlite3_close(db);// 关闭数据库
            NSAssert(NO, @"建表失败!");
        }
        sqlite3_close(db);
    }
}

// 查询
- (StudentModel *)searchWithIdNum:(StudentModel *)model{
    
    NSString *path = [self applicationDocumentsDirectoryFile];
    
    if(sqlite3_open([path UTF8String], &db) != SQLITE_OK){// SQLITE_OK 代表打开成功
        // 失败
        sqlite3_close(db);// 关闭数据库
        NSAssert(NO, @"数据库打开失败!");
    }else{
        NSString *querySQL = @"SELECT idNum,name FROM StudentName where idNum = ?";
        sqlite3_stmt *statement;//语句对象
        
        // 第一个参数是数据库 db对象
        // 第二个参数是SQL语句
        // 第三个参数是执行语句的长度，-1是指全部长度
        // 第四个参数是语句对象
        // 第五个参数是没有执行的语句部分 NULL
        if(sqlite3_prepare_v2(db, [querySQL UTF8String], -1, &statement, NULL) == SQLITE_OK){
            // 进行 按主键查询数据库
            NSString *idNum = model.idNum;
            // 第一个参数 语句对象
            // 第二个参数 参数开始执行的序号
            // 第三个参数 我们要绑定的值
            // 第四个参数 绑定的字符串的长度
            // 第五个参数 指针 NULL
            sqlite3_bind_text(statement, 1, [idNum UTF8String], -1, NULL);
            
            // 有一个返回值 SQLITE_ROW 常量代表查出来了
            if (sqlite3_step(statement) == SQLITE_ROW) {
                // 提取数据
                // 第一个参数 语句对象
                // 第二个参数 字段的索引
                char *idNum = (char *)sqlite3_column_text(statement, 0);
                // 数据转换
                NSString *idNumStr = [[NSString alloc] initWithUTF8String:idNum];
                
                char *name = (char *)sqlite3_column_text(statement, 1);
                NSString *nameStr = [[NSString alloc] initWithUTF8String:name];
                
                StudentModel *respModel = [[StudentModel alloc] init];
                respModel.idNum = idNumStr;
                respModel.name = nameStr;
                
                sqlite3_finalize(statement);
                sqlite3_close(db);
                
                NSLog(@"数据查询成功！idNum=%@",model.idNum);
                
                return respModel;
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    NSLog(@"数据查询失败！idNum=%@",model.idNum);
    StudentModel *respModel = [[StudentModel alloc] init];
    respModel.idNum = @"200";
    respModel.name = @"测试2";
    return respModel;
}

// 保存数据
- (int)insert:(StudentModel *)model{
    NSString *path = [self applicationDocumentsDirectoryFile];
    
    if(sqlite3_open([path UTF8String], &db) != SQLITE_OK){// SQLITE_OK 代表打开成功
        // 失败
        sqlite3_close(db);// 关闭数据库
        NSAssert(NO, @"数据库打开失败!");
    }else{
        // 编写SQL语句
        NSString *insertSQL = @"INSERT OR REPLACE INTO StudentName (idNum,name) VALUES (?,?)";
        // 定义预编译语句
        sqlite3_stmt *statement;
        
        // 进行预处理
        if(sqlite3_prepare_v2(db, [insertSQL UTF8String], -1, &statement, NULL) == SQLITE_OK){
            // 进行参数绑定
            sqlite3_bind_text(statement, 1, [model.idNum UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.name UTF8String], -1, NULL);
            
            // 执行预处理语句
            if (sqlite3_step(statement) != SQLITE_DONE) {
                // 操作未完成
                NSAssert(NO, @"保存数据失败！");
            }
            
            NSLog(@"数据保存成功！idNum=%@,name=%@",model.idNum,model.name);
            
            sqlite3_finalize(statement);
            sqlite3_close(db);
        }
    }
    return 0;
}

@end
