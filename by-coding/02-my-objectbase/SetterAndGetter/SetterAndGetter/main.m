//
//  main.m
//  SetterAndGetter
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        
        [person setName:@"张三"];
        [person setAge:10];
        [person setSex:@"男"];
        
        NSLog(@"%@",person);
        NSLog(@" age = %zd",[person age]);
        
        // 手动释放内存
        [person release];
        
    }
    return 0;
}
