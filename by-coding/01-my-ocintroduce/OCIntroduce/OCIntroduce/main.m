//
//  main.m
//  OCIntroduce
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

// 函数定义
int sum(int numberA,int numberB){
    return numberA + numberB;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // OC 打印函数
        NSLog(@"Hello OS!");
        // C 打印函数
        printf("Hello OC!\n");
        
        // 格式化输出
        printf("%s-%s-%s\n","2017","06","08");// C
        NSLog(@"%s-%s-%s","2017","06","08");// OC
        
        // 函数调用
        int result = sum(5, 10);
        NSLog(@"result = %d",result);
        
    }
    return 0;
}
