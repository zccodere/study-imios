//
//  NSString+Helper.h
//  Category
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 创建分类 对原有类进行功能扩展
 
 */
@interface NSString (Helper)

// 反转字符串
- (NSString *)reverse;
// 反转字符串
+ (NSString *)reverseString:(NSString *)string;

@end
