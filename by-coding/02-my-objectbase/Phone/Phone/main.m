//
//  main.m
//  Phone
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 实例化对象 方式一
        Phone *phone = [Phone new];
        // new 方法实现原理
        // 1.给对象分配内存空间地址
        // 2.给对象完成默认初始化操作
        // 3.返回对象的空间地址
        
        NSLog(@"对象内存空间地址 = %p",phone);
        
        // 实例化对象 方式二
        // 给对象分配内存空间地址
        Phone *phone2 = [Phone alloc];
        // 给对象完成默认初始化操作
        phone2 = [phone2 init];
        
        // 实例化对象 方式三
        // OC 方法连调
        Phone *phone3 = [[Phone alloc] init];
        NSLog(@"对象内存空间地址 = %p",phone3);
        
        // 给属性赋值
        phone->_screenSize = 5.5;
        phone->_color = @"白色";
        phone->_memory = 1024;
        
        NSLog(@"%@",phone);
        // 等价于
        NSLog(@"%@",[phone description]);
        
        // 调用打电话方法
        [phone makeCallToSomeone:@"小明"];
        // 调用发信息方法
        [phone sendMessage:@"今天天气不错" toReceiver:@"小明"];
        
    }
    return 0;
}
