//
//  main.m
//  Category
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Helper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *string = @"01234";
        string = [string reverse];
        NSLog(@"string = %@",string);
        
        string = @"lqwhasd fajfhsa";
        NSLog(@"string = %@",[NSString reverseString:string]);
    
    }
    return 0;
}
