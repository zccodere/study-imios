//
//  MyClass.m
//  ExtendDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

- (void)report{
    _classInt = 1001;
    _classString = @"MyClassStr";
    NSLog(@"ClassName : %@",_className);
    NSLog(@"ClassInt : %d",_classInt);
    NSLog(@"ClassString : %@",_classString);
}

@end
