//
//  main.m
//  MethodDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // [] 代表调用方法，调用方法使用 []
        People *p1 = [[People alloc] init];
        
//        [p1 report];
        
//        [People report1];
//        
//        int a1 = [p1 showWithA:10];
//        NSLog(@"a1 = %d",a1);
//        
//        int a2 = [p1 showWithA:10 andB:20];
//        NSLog(@"a2 = %d",a2);
        
        [p1 report];
        
        People *p2 = [[People alloc] initWithPeopleName:@"张三" andPeopleAge:20];
        People *p3 = [[People alloc] initWithPeopleName:@"李四" andPeopleAge:30];

        [p2 report];
        [p3 report];
        
    }
    return 0;
}
