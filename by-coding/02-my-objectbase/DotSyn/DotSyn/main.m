//
//  main.m
//  DotSyn
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        
        // 方法调用
        [person setName:@"Tom"];
        NSLog(@"name = %@",[person name]);
        
        // 点语法(实质：调用 set 或 get 方法)
        person.name = @"Tim";
        NSLog(@"name = %@",person.name);
        
        
        
    }
    return 0;
}
