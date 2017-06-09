//
//  main.m
//  LoadAndInitialize
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Other.h"
#import "Parent.h"
#import "Child.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Main 被调用");
        
        [Other originalFunc];
        
        Child *child = [[Child alloc] init];
        
        NSLog(@"child = %@",child);
    }
    return 0;
}
