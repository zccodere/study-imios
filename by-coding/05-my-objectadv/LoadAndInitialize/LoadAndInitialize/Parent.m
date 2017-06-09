//
//  Parent.m
//  LoadAndInitialize
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Parent.h"

@implementation Parent

static int number = 0;
static NSMutableArray *mutableArray;

// 重写 load 方法
+ (void)load{
    
    NSLog(@"Load class Parent");
    
}

/*
 initialize 使用场景
 无法在编译器进行初始化时
 */
// 重写 initialize 方法
+ (void)initialize
{
    if (self == [Parent class]) {
        NSLog(@"Initialize Parent,caller class = %@",[self class]);
        // 对 mutableArray 进行初始化
        mutableArray = [NSMutableArray array];
        number = 1;
    }
}

@end
