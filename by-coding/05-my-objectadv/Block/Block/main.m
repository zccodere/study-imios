//
//  main.m
//  Block
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

void test(){
    printf("%s\n",__func__);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // C 语言定义函数指针
        void (*testPtr)() = test;
        
        // 调用函数指针
        testPtr();
        
        // 普通调用
        test();
        
        // 定义 Block 无参
        void (^testBlock)() = ^() {
            // Block 主要实现部分
            test();
            NSLog(@"info");
        };
        // 调用 Block
        testBlock();
        
        int __block number = 10;
        
        // 定义 Block 有参
        int (^sumBlock)(int,int) = ^(int a,int b){
            number = 20;
            return a + b;
        };
        
        NSLog(@"number = %zd",number);
        
        int sum = sumBlock(10,15);
        NSLog(@"sum = %zd",sum);
        
        NSLog(@"number = %zd",number);
    }
    return 0;
}
