//
//  Person.m
//  MRC
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

// 销毁对象之前执行
- (void)dealloc{
    NSLog(@" Person %@ 被销毁",self);
    [super dealloc];
}

+ (instancetype)person{
    Person *person = [[[self alloc] init] autorelease];
    
    return person;
}

- (void)work{
    NSLog(@" %@ 在工作",_name);
}

@end
