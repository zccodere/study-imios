//
//  PlistTest.m
//  PlistFile
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "PlistTest.h"

@implementation PlistTest

+ (void)test{
    
    [self plistOperation];
    
}

// 文件存储和操作
+ (void)plistOperation{
    
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"/test"];
    
    // 数组写入plist文件
    NSString *arrayPlistFilePath = [dirPath stringByAppendingPathComponent:@"/arrayPlist.plist"];
    NSArray *array = @[@"one",@"two",@"three"];
    BOOL arrayWriteToFileResult = [array writeToFile:arrayPlistFilePath atomically:YES];
    if (arrayWriteToFileResult) {
        NSLog(@"文件写入成功，path = %@",arrayPlistFilePath);
    } else{
        NSLog(@"文件写入失败");
    }
    
    // 字典写入plist文件
    NSString *dictPlistFilePath = [dirPath stringByAppendingPathComponent:@"/dictPlist.plist"];
    NSDictionary *dict = @{@"name":@"Tom"};
    BOOL dictWriteToFileResult = [dict writeToFile:dictPlistFilePath atomically:YES];
    if (dictWriteToFileResult) {
        NSLog(@"文件写入成功，path = %@",dictPlistFilePath);
    } else{
        NSLog(@"文件写入失败");
    }
    
    // 数组读取plist文件
    NSArray *arrayReadPlist = [NSArray arrayWithContentsOfFile:arrayPlistFilePath];
    NSLog(@"arrayReadPlist = %@",arrayReadPlist);
    
    // 字典读取plist文件
    NSDictionary *dictReadPlist = [NSDictionary dictionaryWithContentsOfFile:dictPlistFilePath];
    NSLog(@"dictReadPlist = %@",dictReadPlist);
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
