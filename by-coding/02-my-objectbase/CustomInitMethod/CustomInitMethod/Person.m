//
//  Person.m
//  CustomInitMethod
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

// 实现 自定义构造方法
// 初始化 _name
- (instancetype)initWithName:(NSString *)name{
    return [self initWithName:name age:0 sex:@""];
}
// 初始化 _age
- (instancetype)initWithAge:(NSUInteger *)age{
    return [self initWithName:@"" age:age sex:@""];
}
// 初始化 _name 和 _age 和 _sex
- (instancetype)initWithName:(NSString *)name age:(NSUInteger *)age sex:(NSString *)sex{
    // 先调用父类的初始化方法
    self = [super init];
    
    if(self){
        _name = name;
        _age = age;
        _sex = sex;
    }
    return self;
}

// 重写父类的 description 方法 类似 Java 中的 toString 方法
- (NSString *)description{
    return [NSString stringWithFormat:@"Person信息[name=%@，age=%zd，sex=%@]",_name,_age,_sex];
}

@end
