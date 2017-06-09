//
//  main.m
//  ARC
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 当使用一个强指针指向一个对象时，就会引起引用计数+1，这个指针就拥有了这个对象的绝对使用权。
// 如果没有任何强指针指向这个对象时，对象就被立即销毁

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [[Person alloc] init];
        NSLog(@" &person = %@",person);
        
        Person *person1 = [[Person alloc] init];
        NSLog(@" &person1 = %@",person1);
        
        Person __weak *person2 = person;
        NSLog(@" &person2 = %@",person2);
        
        Person __unsafe_unretained *person3 = person;
        NSLog(@" &person3 = %@",person3);
        
    }
    
    return 0;
}
