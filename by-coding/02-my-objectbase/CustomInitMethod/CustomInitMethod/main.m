//
//  main.m
//  CustomInitMethod
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 实例化对象并执行指定的初始化方法
        Person *person = [[Person alloc] initWithAge:(NSUInteger *)10];
        
        person = [[Person alloc] initWithName:@"张三"];
        
        person = [[Person alloc] initWithName:@"张三" age:(NSUInteger *)20 sex:@"男"];
        
        NSLog(@"%@",person);
        
    }
    return 0;
}
