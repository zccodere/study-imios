//
//  main.m
//  Class1
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
// 导入类的声明
#import "People.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 实例化对象，*代表指针，即在OC中，所有对象都是指针。
        /*
         [类名 方法名]
         [对象名 方法名]
         alloc 为对象分配内存空间
         init 进行初始化操作
         */
        People *p1 = [[People alloc] init];
        People *p2 = [[People alloc] init];

        People *p3 = [People new];//不建议使用
        
        NSLog(@"p1 : %p",p1);
        NSLog(@"p2 : %p",p2);
        NSLog(@"p3 : %p",p3);
        
        p1.peopleName =  @"张三";
        p2.peopleName =  @"李四";
        NSLog(@"people name : %@",p1.peopleName);
        NSLog(@"people name : %@",p2.peopleName);
    }
    return 0;
}
