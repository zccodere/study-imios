//
//  main.m
//  Property
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        
        person.name = @"张三";
        
        NSLog(@"name = %@",person.name);
        
        NSMutableString *sex = [NSMutableString stringWithString:@"男"];
        person.sex = sex;
        NSLog(@"&sex = %p, &person.sex = %p",sex,person.sex);
        
    }
    return 0;
}
