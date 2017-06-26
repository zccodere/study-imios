//
//  BlackPrinter.m
//  DuoTaiDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "BlackPrinter.h"

@implementation BlackPrinter

// 方法重写
- (void)print{
    
    // 调用父类方法
    [super print];
    
    // 调用当前类方法
    //[self print];
    
    NSLog(@"黑白打印机");
}

@end
