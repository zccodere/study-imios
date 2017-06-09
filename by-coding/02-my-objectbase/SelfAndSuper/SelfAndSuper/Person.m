//
//  Person.m
//  SelfAndSuper
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

// 使用类方法实例化对象
+ (instancetype)person{
    
    Person *person = [[self alloc] init];
    NSLog(@"person init class is %@",[self class]);
    return person;
}

- (void)setName:(NSString *)name{
    _name = name;
    
    NSLog(@"self class is %@",[self class]);
    NSLog(@"super class is %@",[super class]);
}

@end
