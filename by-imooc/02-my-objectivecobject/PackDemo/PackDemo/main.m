//
//  main.m
//  PackDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MyClass *mc = [[MyClass alloc] init];
        
        mc.className = @"我的类";
        
        [mc report];
        // 使用指向来调用类中的公有成员变量
        mc->_classInt = 1001;
        
        [mc report];
        
        
    }
    return 0;
}
