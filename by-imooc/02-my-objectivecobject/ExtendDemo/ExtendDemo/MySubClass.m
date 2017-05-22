//
//  MySubClass.m
//  ExtendDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "MySubClass.h"

@implementation MySubClass

- (void)show{
    _classInt = 1002;
    // 父类中的私有变量我们是无法继承使用的
    //_classString = @"fdsf";
    NSLog(@"show : %d",_classInt);
    
    // 如果父类中的方法没有写声明则子类无法继承父类中对应的方法
    [self report];
}

@end
