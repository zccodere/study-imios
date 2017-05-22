//
//  main.m
//  MutableStringDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 可变字符串是字符串的子类
        NSMutableString *str = [[NSMutableString alloc] initWithCapacity:10];
        [str setString:@"Hello"];
        NSLog(@"str = %@",str);
        
        // 1.追加字符串
        [str appendString:@" world"];
        int a = 10;
        [str appendFormat:@" - %d",a];
        NSLog(@"str = %@",str);
        
        // 2.替换字符串
        NSRange range = [str rangeOfString:@"world"];
        [str replaceCharactersInRange:range withString:@"iOS"];
        NSLog(@"str = %@",str);
        
        // 3.插入字符串
        [str insertString:@"A" atIndex:6];
        NSLog(@"str = %@",str);
        
        // 4.删除字符串
        NSRange range1 = [str rangeOfString:@"AiOS"];
        [str deleteCharactersInRange:range1];
        NSLog(@"str = %@",str);
    }
    return 0;
}
