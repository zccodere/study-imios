//
//  Person.h
//  CustomInitMethod
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
    NSUInteger *_age;
    NSString *_sex;
}

// 声明 自定义构造方法
// 初始化 _name
- (instancetype)initWithName:(NSString *)name;
// 初始化 _age
- (instancetype)initWithAge:(NSUInteger *)age;
// 初始化 _name 和 _age 和 _sex
- (instancetype)initWithName:(NSString *)name age:(NSUInteger *)age sex:(NSString *)sex;
@end
