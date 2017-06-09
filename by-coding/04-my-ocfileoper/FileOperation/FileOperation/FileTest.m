//
//  FileTest.m
//  FileOperation
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "FileTest.h"

@implementation FileTest

+ (void)test{
    
    //[self createFileDir];
    [self fileOperation];
}

// 创建目录
+ (void)createFileDir{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"/test"];
    
    // 创建目录
    NSError *error = nil;
    // withIntermediateDirectories YES 可以覆盖 NO 不可以覆盖
    BOOL createDirresult = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (createDirresult) {
        NSLog(@"文件目录创建成功");
    } else{
        NSLog(@"文件目录建失败,reason = %@",error);
        return;
    }
    
    // 文件内容
    NSString *string = @"文件操作";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    // 创建文件
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"test.txt"];
    BOOL createFileResult = [fileManager createFileAtPath:filePath contents:data attributes:nil];
    if (createFileResult) {
        NSLog(@"文件创建成功");
    } else{
        NSLog(@"文件创建失败");
    }
    
    // 文件遍历 浅度遍历 只遍历指定目录
    NSArray *fileArray = [fileManager contentsOfDirectoryAtPath:dirPath error:nil];
    NSLog(@"dirPath = %@",dirPath);
    NSLog(@"fileArray = %@",fileArray);
    
    // 文件遍历 深度遍历 遍历指定目录和循环遍历子目录
    fileArray = [fileManager subpathsOfDirectoryAtPath:dirPath error:nil];
    NSLog(@"dirPath = %@",dirPath);
    NSLog(@"fileArray = %@",fileArray);
    
    // 文件移动
    [fileManager moveItemAtPath:filePath toPath:[dirPath stringByAppendingString:@"/move/testmove.txt"]  error:nil];
    
    // 文件复制
    [fileManager copyItemAtPath:[dirPath stringByAppendingString:@"/move/test.txt"] toPath:[dirPath stringByAppendingString:@"/testcopy.txt"] error:nil];
    
    // 文件删除
    [fileManager removeItemAtPath:[dirPath stringByAppendingString:@"/testcopy.txt"] error:nil];
    
    // 文件属性
    NSDictionary *fileAttrDict = [fileManager attributesOfItemAtPath:[dirPath stringByAppendingString:@"/move/testmove.txt"]  error:nil];
    NSLog(@"fileAttrDict = %@",fileAttrDict);
    
    // 文件在某个目录下是否存在
    NSString *fileExistsPath = [dirPath stringByAppendingString:@"/move/testmove.txt"];
    BOOL fileExistsResult = [fileManager fileExistsAtPath:fileExistsPath];
    if (fileExistsResult) {
        NSLog(@"文件存在，path = %@",fileExistsPath);
    } else{
        NSLog(@"文件不存在，path = %@",fileExistsPath);
    }
}

// 文件操作
+ (void)fileOperation{
    
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"/test"];
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"/test.txt"];
    
    // 只读方式打开文件
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    // 从光标位置读到结尾
    NSLog(@"fileBody = %@",[fileHandle readDataToEndOfFile]);
    [fileHandle closeFile];
    
    // 只写方式打开文件
    fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    [fileHandle closeFile];
    
    // 读写方式打开文件
    fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    // 从光标位置读到结尾
    NSLog(@"fileBody = %@",[fileHandle readDataToEndOfFile]);
    
    // 移动光标到开始位置
    [fileHandle seekToFileOffset:0];
    NSLog(@"fileBody = %@",[fileHandle readDataOfLength:1]);
    
    // 移动光标到末尾位置
    [fileHandle seekToEndOfFile];
    NSString *data = @"www.baidu.com";
    [fileHandle writeData:[data dataUsingEncoding:NSUTF8StringEncoding]];
    // 同步文件
    [fileHandle synchronizeFile];
    
    [fileHandle closeFile];
    
    
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
