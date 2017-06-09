//
//  Other.m
//  LoadAndInitialize
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Other.h"
#import <objc/runtime.h>

@implementation Other

static NSString *name;

// 重写 load 方法
+ (void)load{
    
    name = @"Other";
    NSLog(@"Load class Other");
    
    // 进行方法交换
    Method original = class_getClassMethod([self class], @selector(originalFunc));
    Method swizzled = class_getClassMethod([self class], @selector(swizzledFunc));
    
    method_exchangeImplementations(original, swizzled);
}

- (void)printName{
    NSLog(@"name = %@",name);
}
+ (void)originalFunc{
    NSLog(@"func name = %s",__func__);
}
+ (void)swizzledFunc{
    NSLog(@"func name = %s",__func__);
}

@end
