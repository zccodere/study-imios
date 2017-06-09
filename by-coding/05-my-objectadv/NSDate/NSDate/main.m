//
//  main.m
//  NSDate
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 默认获取格林尼治时区时间
        NSDate *date = [NSDate date];
        NSLog(@"当前日期：%@",date);
        // 默认获取格林尼治时区时间
        date = [[NSDate alloc] initWithTimeInterval:60 sinceDate:date];
        NSLog(@"60S之后的时间：%@",date);
        
        // 获取系统当前时区
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        // 系统当前时区与格林尼治时区的时间差
        NSInteger interval = [zone secondsFromGMTForDate:date];
        // 获取本地时间
        NSDate *localDate = [date dateByAddingTimeInterval:interval];
        NSLog(@"本地时间：%@",localDate);
        
        // 当前时间
        NSDate *currentDate = [NSDate date];
        // 比当前晚一个小时时间
        NSDate *laterDate = [[NSDate alloc] initWithTimeInterval:60 * 60 sinceDate:currentDate];
        // 比当前早一个小时时间
        NSDate *earlierDate = [[NSDate alloc] initWithTimeInterval:-60 * 60 sinceDate:currentDate];
        
        // 比较哪个日期晚
        if ([currentDate laterDate:laterDate]) {
            NSLog(@"current %@ 比 later %@ 晚",currentDate,laterDate);
        }
        // 比较哪个日期早
        if ([currentDate earlierDate:earlierDate]) {
            NSLog(@"current %@ 比 earlier %@ 早",currentDate,earlierDate);
        }
        // 日期比较
        if ([currentDate compare:earlierDate] == NSOrderedDescending) {
            NSLog(@"currentDate 晚");
        }
        
        // NSDate -> NSString
        NSDate *date1 = [NSDate date];
        // 获取日期格式化对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        // 设置转换格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
        
        NSString *dateString = [dateFormatter stringFromDate:date1];
        NSLog(@"dateString = %@",dateString);
        
        // NSString -> NSDate
        dateString = @"2016-11-11 11:11:11";
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        date1 = [dateFormatter dateFromString:dateString];
        NSLog(@"date1 = %@",date1);
    }
    return 0;
}
