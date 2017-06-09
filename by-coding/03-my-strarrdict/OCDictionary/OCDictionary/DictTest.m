//
//  DictTest.m
//  OCDictionary
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "DictTest.h"

@implementation DictTest

+ (void)test{
    
//    [self createDict];
//    [self traverseDict];
    [self mutableDict];
}

// 创建字典 key-value 类似Java的Map
+ (void)createDict{
    
    // 方式一 value,key,value,key
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"one",@"1",@"two",@"2", nil];
    NSLog(@"dict = %@",dict);
    
    // 方式二 key:value,key:value
    dict = @{@"name":@"Tom",
             @"nickname":@"tangmu",
             @"age":@2,
             @"sex":@"male"};
    NSLog(@"dict = %@",dict);
    
    // 通过 key 查找 value
    // 当知道key不存在时，返回nil，注意处理
    NSString *name = [dict objectForKey:@"name"];
    NSLog(@"name = %@",name);
    
    NSNumber *age = [dict objectForKey:@"age"];
    NSLog(@"age = %@",age);
    
    // 通过 value 查找 key
    NSLog(@"all keys = %@",[dict allKeysForObject:@"Tom"]);
    NSLog(@"all keys = %@",[dict allKeys]);
    NSLog(@"all values = %@",[dict allValues]);
    
    // 嵌套使用
    dict = @{@"name":@"Tom",
             @"infoArray":@[@"1",@"2"],
             @"infoDict":@{@"array":@[@"1",@"2"]}};
    NSLog(@"dict = %@",dict);
}

// 遍历字典
+ (void)traverseDict{
    
    NSDictionary *dict = @{@"name":@"Tom",
                           @"nickname":@"tangmu",
                           @"age":@20,
                           @"sex":@"male"};
    NSLog(@"dict = %@",dict);
    
    // 方式一 for in 循环
    for (NSString *key in dict) {
        NSLog(@"key = %@ : value = %@",key,dict[key]);
    }
    
    // 方式二 遍历 value
    for (id object in dict.allValues) {
        NSLog(@"value = %@",object);
    }
}

// 可变字典
+ (void)mutableDict{
    
    NSDictionary *dict = @{@"name":@"Tom",
                           @"nickname":@"tangmu",
                           @"age":@20,
                           @"sex":@"male"};
 
    // 创建一个空的可变字典
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    
    [mutableDict addEntriesFromDictionary:dict];
    // 当 key 存在时，执行修改操作，当 key 不存在时，执行增加操作
    [mutableDict setObject:@170 forKey:@"height"];
    [mutableDict setObject:@30 forKey:@"age"];
    
    [mutableDict removeObjectForKey:@"height"];
//    [mutableDict removeAllObjects];
    
    // 当 value 为 nil 时，执行删除操作，当 value 不为 nil 时，执行修改操作
    [mutableDict setValue:nil forKey:@"name"];
    
    NSLog(@"mutableDict = %@",mutableDict);
    
}

@end
