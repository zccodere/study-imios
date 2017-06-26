//
//  ViewController.m
//  MyPathFunc
//
//  Created by zc on 2017/6/6.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self getHomePath];
//    [self getDocumentsPath];
//    [self getLibraryPath];
//    [self getTmpPath];
//    [self parsePath];
//    [self createFolder];
//    [self createFile];
//    [self writeFile];
//    [self addFileContent];
//    [self removeFile];
    [self writeImage];
}

// 获取沙盒的路径
- (NSString *)getHomePath{
    NSString *homePath = NSHomeDirectory();
    NSLog(@"HomePath = %@",homePath);
    return homePath;
}

// 获取 Documents 路径
- (NSString *)getDocumentsPath{
    // 在应用中检索指定的路径
    // 第一个参数：搜索的路径名称
    // 第二个参数：限定在沙盒内
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [docPaths lastObject];
    NSLog(@"DocumentPath = %@",documentPath);
    return documentPath;
}

// 获取 Library 路径
- (NSString *)getLibraryPath{
    NSArray *libPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libPaths firstObject];
    NSLog(@"LibraryPath = %@",libraryPath);
    return libraryPath;
}

// 获取 Tmp 路径
- (NSString *)getTmpPath{
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"TmpPath = %@",tmpPath);
    return tmpPath;
}

// NSString 类的路径函数的处理
- (void)parsePath {
    NSString *path = @"/data/Containers/Data/Application/test.png";
    // 获得路径的各个组成部分
    NSArray *array = [path pathComponents];
    NSLog(@"PathComponents = %@",array);
    // 提取路径的最后一个组成部分
    NSString *name = [path lastPathComponent];
    NSLog(@"FileName = %@",name);
    // 删除路径的最后一个组成部分
    NSString *string = [path stringByDeletingLastPathComponent];
    NSLog(@"LastPath = %@",string);
    // 追加 name.txt
    NSString *addString = [string stringByAppendingPathComponent:@"name.txt"];
    NSLog(@"AddString = %@",addString);
}

// NSData 数据转换
- (void) dataChange:(NSData *)data {
    
    // NSData -> NSString
    NSString *aString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // NSString -> NSData
    NSData *aData = [aString dataUsingEncoding:NSUTF8StringEncoding];
    
    // NSData -> UIImage
    UIImage *image = [UIImage imageWithData:aData];
    
    // UIImage -> NSData
    NSData *data2 = UIImagePNGRepresentation(image);
    NSLog(@"%@",data2);
    
}

// 创建文件夹
- (void)createFolder {
    NSString *docPath = [self getDocumentsPath];
    NSString *testPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    // withIntermediateDirectories YES 可以覆盖 NO 不可以覆盖
    BOOL result = [manager createDirectoryAtPath:testPath withIntermediateDirectories:YES attributes:nil error:nil];
    if (result) {
        NSLog(@"文件夹创建成功");
    } else{
        NSLog(@"文件夹创建失败");
    }
}

// 创建文件
- (void)createFile {
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"我的笔记.txt"];
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL result = [manager createFileAtPath:filePath contents:nil attributes:nil];
    if (result) {
        NSLog(@"文件创建成功");
    } else{
        NSLog(@"文件创建失败");
    }
}

// 写入文件
- (void)writeFile {
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"我的笔记.txt"];
    
    NSString *content = @"测试写笔记";
    
    BOOL result = [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (result) {
        NSLog(@"文件写入成功");
    } else{
        NSLog(@"文件写入失败");
    }
    
}

// 判断指定文件是否存在
- (BOOL)fileExist:(NSString *)filePath{
    NSFileManager *manager = [NSFileManager defaultManager];
    if([manager fileExistsAtPath:filePath]){
        return YES;
    }
    return NO;
}

// 追加文件内容
- (void) addFileContent{
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"我的笔记.txt"];
    
    // 打开文件，准备更新
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    // 将节点跳到文件的末尾
    [fileHandle seekToEndOfFile];
    NSString *addContent = @"这是我要追加上去的内容";
    NSData *addContentData = [addContent dataUsingEncoding:NSUTF8StringEncoding];
    // 写入数据
    [fileHandle writeData:addContentData];
    // 关闭文件
    [fileHandle closeFile];
}

// 删除文件
- (void)removeFile{
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"我的笔记.txt"];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isExist = [self fileExist:filePath];
    if(isExist){
        BOOL result = [manager removeItemAtPath:filePath error:nil];
        if (result) {
            NSLog(@"文件删除成功");
        }else{
            NSLog(@"文件删除失败");
        }
    }else{
        NSLog(@"文件不存在。文件路径 = %@",filePath);
        return;
    }
}

// 写入图片
- (void)writeImage{
    UIImage *testImage = [UIImage imageNamed:@"1.jpg"];
    NSData *imageData = UIImagePNGRepresentation(testImage);
    
    NSString *docPath = [self getDocumentsPath];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"慕课网"];
    NSString *filePath = [dirPath stringByAppendingPathComponent:@"图片"];
    
    [imageData writeToFile:filePath atomically:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
