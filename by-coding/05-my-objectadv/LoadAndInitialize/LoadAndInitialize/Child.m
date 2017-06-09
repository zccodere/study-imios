//
//  Child.m
//  LoadAndInitialize
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Child.h"
#import "Other.h"

@implementation Child

// 重写 load 方法
+ (void)load{
    
    NSLog(@"Load class Child");
    
    Other *other = [Other new];
    [other printName];
    
    [Other originalFunc];
    
}

// 重写 initialize 方法
+ (void)initialize
{
    NSLog(@"Initialize Child,caller class = %@",[self class]);
}

@end
