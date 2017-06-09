//
//  UserDefaultsTest.m
//  UserDefaults
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "UserDefaultsTest.h"

@implementation UserDefaultsTest

+ (void)test{

    [self UserDefaultsOperation];
    
}

// NSUserDefaults 相关操作
+ (void)UserDefaultsOperation{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 写入数据
    NSString *string = @"www.baidu.com";
    [defaults setObject:string forKey:@"webset"];
    // 同步 将文件内容从内存同步到磁盘
    [defaults synchronize];
    
    // 读取数据
    NSString *result = [defaults objectForKey:@"webset"];
    NSLog(@"result = %@",result);
    
    // 删除数据
//    [defaults removeObjectForKey:@"webset"];
    
    // 打印 NSUserDefaults 中的所有键值对
    NSDictionary *dict = defaults.dictionaryRepresentation;
    NSLog(@"NSUserDefaults = %@",dict);

}

@end
