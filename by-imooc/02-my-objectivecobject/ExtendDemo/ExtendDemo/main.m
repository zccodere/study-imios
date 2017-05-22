//
//  main.m
//  ExtendDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "MySubClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 父类
        MyClass *mc = [[MyClass alloc] init];
        mc.className = @"MyClass";
        [mc report];
        
        // 子类
        MySubClass *msc = [[MySubClass alloc] init];
        msc.className = @"MySubClass";
        [msc report];
        [msc show];
    }
    return 0;
}
