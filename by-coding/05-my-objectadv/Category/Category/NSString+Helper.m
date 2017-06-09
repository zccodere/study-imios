//
//  NSString+Helper.m
//  Category
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

// 反转字符串
- (NSString *)reverse{
    NSUInteger length = self.length;
    // 缓冲区
    unichar *buffer = calloc(length, sizeof(unichar));
    // 将字符串分割成字符存入缓冲区
    [self getCharacters:buffer range:NSMakeRange(0, length)];
    // 进行交换
    for (NSInteger i = 0; i < length / 2; i++) {
        unichar temp = buffer[i];
        buffer[i] = buffer[length-1-i];
        buffer[length-1-i] = temp;
    }
    // 将字符转换成字符串
    NSString *result = [NSString stringWithCharacters:buffer length:length];
    // 释放空间
    free(buffer);
    return result;
}
// 反转字符串
+ (NSString *)reverseString:(NSString *)string{
    return [string reverse];
}


@end
