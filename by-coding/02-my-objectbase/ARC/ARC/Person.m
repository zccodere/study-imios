//
//  Person.m
//  ARC
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc{
    
    // 监听 Person 什么时候被销毁
    NSLog(@" Person %@ 被销毁",self);
    
    // ARC 下不需要手动调用
    //[super dealloc];
}

@end
