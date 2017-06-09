//
//  ArchiverTest.m
//  Archiver
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "ArchiverTest.h"
#import "Person.h"

@implementation ArchiverTest

+ (void)test {
    
    [self archiverOper];
    
}

// 自定义对象数据持久化 归档和解档
+ (void)archiverOper{
    
    // 目录和文件路径
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"/test"];
    NSString *personDataFilePath = [dirPath stringByAppendingPathComponent:@"/personData"];
    
    Person *person = [[Person alloc] init];
    person.name = @"Tom";
    person.age = (NSUInteger *)20;
    person.sex = @"male";
    
    // 归档
    // 使用归档器将对象转换成数据
    NSData *personData = [NSKeyedArchiver archivedDataWithRootObject:person];
    NSLog(@"personData = %@",personData);
    // 数据写入磁盘
    [personData writeToFile:personDataFilePath atomically:YES];
    
    // 解档
    // 去读磁盘数据
    personData = [NSData dataWithContentsOfFile:personDataFilePath];
    // 使用解档器将数据转换成对象
    Person *resultPerson = [NSKeyedUnarchiver unarchiveObjectWithData:personData];
    NSLog(@"resultPerson = %@",resultPerson);
    
    // 多个对象归档到一个文件中
    Person *person1 = [[Person alloc] init];
    person.name = @"xiaohong";
    person.age = (NSUInteger *)20;
    person.sex = @"famale";
    // 创建空可变数据
    NSMutableData *mutableData = [NSMutableData data];
    // 创建归档器
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mutableData];
    // 进行归档
    [archiver encodeObject:person forKey:@"person"];
    [archiver encodeObject:person1 forKey:@"person1"];
    // 完成归档，将对象转换成数据
    [archiver finishEncoding];
    NSLog(@"mutableData = %@",mutableData);
    // 数据写入磁盘
    // 和单个对象类似
}

// 获取 Documents 路径
+ (NSString *)getDocumentsPath{
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [docPaths lastObject];
    NSLog(@"DocumentPath = %@",documentPath);
    return documentPath;
}

// 获取 Library 路径
+ (NSString *)getLibraryPath{
    NSArray *libPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libPaths firstObject];
    NSLog(@"LibraryPath = %@",libraryPath);
    return libraryPath;
}

// 获取 Tmp 路径
+ (NSString *)getTmpPath{
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"TmpPath = %@",tmpPath);
    return tmpPath;
}


@end
