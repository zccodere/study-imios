//
//  main.m
//  MRC
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *person2 = nil;
    
    @autoreleasepool {
        
        Person *person = [Person new];
        [person work];
        
        // retainCount 是对象是否被销毁的唯一标志
        //NSLog(@" Person 引用计数 = %lu",person.retainCount);
        
        [person release];
//        [person release];
//        [person work];
        
        Person *person1 = [Person person];
        [person1 work];
        
        person2 = [person1 retain];
        
    }
    
    [person2 work];
    [person2 release];
    
    return 0;
}
