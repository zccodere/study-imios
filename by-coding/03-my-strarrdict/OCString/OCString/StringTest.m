//
//  StringTest.m
//  OCString
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "StringTest.h"

@implementation StringTest

+ (void)test{
    
    //[self createString];
    //[self appendSeparatedString];
    //[self compareString];
    //[self otherMethod];
    [self mutableString];
}

// 创建不可变字符串
+ (void)createString{
    
    NSString *string = [[NSString alloc] init];
    NSLog(@"&string = %p, string = %@",string,string);
    
    string = @"hello world";
    NSLog(@"&string = %p, string = %@",string,string);
    
    NSString *string2 = @"hello world";
    NSLog(@"&string2 = %p, string2 = %@",string2,string2);
    
    const char *cString = "utf-8 string";
    string2 = [[NSString alloc] initWithCString:cString encoding:NSUTF8StringEncoding];
    NSLog(@"&string2 = %p, string2 = %@",string2,string2);
    
    string2 = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
    
    string2 = [NSString stringWithFormat:@"%@年%@月%@日",@"2017",@"6",@"8"];
    NSLog(@"&string2 = %p, string2 = %@",string2,string2);
    
}

// 拼接和截取字符串
+ (void)appendSeparatedString{
    // 拼接
    NSString *string1 = @"www.";
    NSString *string2 = @"baidu.com";
    
    // 方式一
    NSString *string3 = [NSString stringWithFormat:@"%@%@",string1,string2];
    NSLog(@"string3 = %@",string3);
    
    // 方式二
    string3 = [string3 stringByAppendingString:@"(百度网址)"];
    NSLog(@"string3 = %@",string3);
    
    // 方式三
    string3 = [string3 stringByAppendingFormat:@"%d年%d月%d日",2017,6,9];
    NSLog(@"string3 = %@",string3);
    
    // 分割
    // 按点分割
    NSArray *components = [string3 componentsSeparatedByString:@"."];
    NSLog(@"components = %@",components);
    // 按指定的字符分割
    components = [string3 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@".()"]];
    NSLog(@"components = %@",components);
    
    // 截取
    // 获取子串
    NSString *subString = [string3 substringFromIndex:5];
    NSLog(@" subString = %@",subString);
    
    subString = [string3 substringToIndex:5];
    NSLog(@" subString = %@",subString);
    
    subString = [string3 substringWithRange:NSMakeRange(0, 5)];
    NSLog(@" subString = %@",subString);

}

// 比较字符串
+ (void)compareString{
    NSString *string1 = @"hello";
    NSString *string2 = @"hello";
    string2 = [NSString stringWithFormat:@"hello"];
    
    // == 默认比较对象的内存地址【不可靠】
    if (string1 == string2) {
        NSLog(@"相等");
    }else{
        NSLog(@"不等");
    }
    
    // 调用 isEqualToString 方法进行比较
    if([string1 isEqualToString:string2]){
        NSLog(@"相等");
    }else{
        NSLog(@"不等");
    }
    
    string1 = @"abc";
    string2 = @"abcd";
    
    // 调用 compare 方法进行比较
    NSComparisonResult result = [string1 compare:string2];
    switch (result) {
        case NSOrderedAscending:
            NSLog(@" string1 < string2");
            break;
        case NSOrderedSame:
            NSLog(@" string1 = string2");
            break;
        case NSOrderedDescending:
            NSLog(@" string1 > string2");
            break;
        default:
            break;
    }
    
    string1 = @"hello";
    string2 = @"hello";
    
    // 调用 compare 方法进行比较
    if ([string1 compare:string2] == NSOrderedSame) {
        NSLog(@"相同");
    } else {
        NSLog(@"不同");
    }

}

// 不可变字符串的其它方法
+ (void)otherMethod{
    
    NSString *string = @"www.baidu.com";
    
    NSLog(@" string length = %zd",string.length);
    
    NSLog(@" string uppercase = %@",string.uppercaseString);
    
    NSLog(@" string lowercase = %@",string.lowercaseString);
    
    // 是否有指定字符串前缀
    BOOL result = [string hasPrefix:@"www"];
    if (result) {
        NSLog(@" YES");
    } else {
        NSLog(@" NO");
    }
    
    // 是否有指定字符串后缀
    result = [string hasSuffix:@"com"];
    if (result) {
        NSLog(@" YES");
    } else {
        NSLog(@" NO");
    }
    
    NSRange range = [string rangeOfString:@"baidu"];
    NSLog(@" baidu range %@",NSStringFromRange(range));
    
}

// 可变字符串
+ (void)mutableString{
    
    // 创建可变字符串
    NSMutableString *string = [[NSMutableString alloc] init];
    
    string = [NSMutableString string];
    NSLog(@" &string = %p, string = %@",string,string);
    
    // 设置字符串
    [string setString:@"可变字符串"];
    NSLog(@" &string = %p, string = %@",string,string);
    
    // 追加字符串
    [string appendString:@"www.baidu.com"];
    NSLog(@" &string = %p, string = %@",string,string);
    
    [string insertString:@"(百度网址)" atIndex:5];
    NSLog(@" &string = %p, string = %@",string,string);
    
    [string deleteCharactersInRange:[string rangeOfString:@"(百度网址)"]];
    NSLog(@" &string = %p, string = %@",string,string);
    
    // 替换字符串
    [string replaceCharactersInRange:NSMakeRange(0, 5) withString:@"123"];
    NSLog(@" &string = %p, string = %@",string,string);
}

@end
