//
//  main.m
//  KVC
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

/*
 使用 KVC 完成属性赋值
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        User *user = [[User alloc] init];
        // 使用 KVC 完成属性赋值
        [user setValue:@"default" forKey:@"username"];
        [user setValue:@"baidu" forKey:@"company"];
        [user setValue:@20 forKey:@"age"];
        // 使用 KVC 完成对隐藏属性赋值
        [user setValue:@"male" forKey:@"sex"];
        
        NSLog(@"user = %@",user);
    }
    return 0;
}
