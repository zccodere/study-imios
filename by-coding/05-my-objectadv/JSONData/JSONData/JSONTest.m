//
//  JSONTest.m
//  JSONData
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "JSONTest.h"

@implementation JSONTest

+ (void)test {
    
    [self JSONOper];
    
}

// JSON 操作
+ (void)JSONOper{
    
    // json 字典
    NSDictionary *jsonDict = @{@"name":@"Tom",
                               @"age":@20};
    // 将对象转换为 json 数据
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
    NSLog(@"jsonData = %@",jsonData);
    
    // json 字符串
    NSString *jsonString = @"{\"name\":\"xiaohong\"}";
    // 将 json 字符串转换为 json 数据
    jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    // 将 json 数据转换为 json 对象
    NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    NSLog(@"resultDict = %@",resultDict);
    
    
}

@end
