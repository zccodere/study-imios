//
//  main.m
//  StringDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        // 2-1 NSString(上)
        char *s = "hello objective-c";
        NSString *str = @"hello";
        
        // OC与C字符串类型转换
        // C -> OC
        NSString *str1 = [NSString stringWithUTF8String:s];
        NSLog(@"str1 = %@",str1);
        // OC -> C
        NSLog(@"str2 = %s",[str UTF8String]);
        
        // 基本用法
        // 创建字符串
        NSString *str3 = @"iOS";
        NSString *str4 = [[NSString alloc] init];
        str4 = @"iOS";
        // 格式化字符串
        int a = 10;
        int b = 20;
        NSString *str5 = [NSString stringWithFormat:@"a = %d,b = %d",a,b];
        NSLog(@"str5 = [ %@ ]",str5);
        // 拼接字符串
        NSString *str6 = [str5 stringByAppendingString:str3];
        NSLog(@"str6 = [ %@ ]",str6);
        
        // 大小写转换
        // 转为小写
        NSString *str7 = @"aBcDEF";
        NSString *str8 = [str7 lowercaseString];
        NSLog(@"str8 = %@",str8);
        // 转为大写
        NSString *str9 = [str7 uppercaseString];
        NSLog(@"str9 = %@",str9);
        
        // 前缀和后缀的判断
        NSString *str10 = @"www.imooc.com";
        // 判断前缀
        BOOL hasPreFix = [str10 hasPrefix:@"www."];
        if (hasPreFix) {
            NSLog(@"有对应前缀");
        }else{
            NSLog(@"没有对应前缀");
        }
        // 判断后缀
        BOOL hasSufFix = [str10 hasSuffix:@".com"];
        if (hasSufFix) {
            NSLog(@"有对应后缀");
        }else{
            NSLog(@"没有对应后缀");
        }
        
        
        // 2-2 NSString(中)
        
        // 判断两个字符串是否相同
        NSString *str11 = @"helo";
        NSString *str12 = @"hello";
        if([str11 isEqualToString:str12]){
            NSLog(@"两个字符串相同");
        }else{
            NSLog(@"两个字符串不同");
        }
        // 比较字符串
        //NSComparisonResult
        
        // 字符串分割
        // 按照指定字符分割字符串
        NSString *str13 = @"a,b,c,d,e,f,g";
        NSArray *strArray = [str13 componentsSeparatedByString:@","];
        for (NSString *strTemp in strArray){
            NSLog(@"str = %@",strTemp);
        }
        
        // 按照范围截取字符串
        // 创建范围
        NSRange range = NSMakeRange(1, 5);
        NSString *str14 = [str13 substringWithRange:range];
        NSLog(@"str14 = %@",str14);
        // 从某一位开始截取后面的字符串
        NSString *str15 = [str13 substringFromIndex:2];
        NSLog(@"str15 = %@",str15);
        // 从开头截取到某一位
        NSString *str16 = [str13 substringToIndex:7];
        NSLog(@"str16 = %@",str16);
        
        // 将字符串拆分为每一个字符
        for(int i=0;i<[str13 length];i++){
            NSLog(@"%c",[str13 characterAtIndex:i]);
        }
        
        // 查找
        NSString *str17 = @"ab cd ef gh ij ab";
        // 查找指定字符串的位置
        NSRange range1 = [str17 rangeOfString:@"ab"];
        NSLog(@"range1.location:%ld range1.length:%ld",range1.location,range1.length);
        
        // 替换
        NSString *str18 = @"Hello iOS,Hello imooc";
        // 替换某一个范围的内容
        NSString *str19 = [str18 stringByReplacingCharactersInRange:NSMakeRange(0, 5) withString:@"你好"];
        NSLog(@"str19 = %@",str19);
        
        
        // 2-3 NSString(下)
        
        // 用指定字符串替换原字符串中的子串
        // stringByReplacingOccurrencesOfString:源字符串中要被替换的内容；withString:替换的字符串
        NSString *str20 = [str18 stringByReplacingOccurrencesOfString:@"Hello" withString:@"你好"];
        NSLog(@"str20 = %@",str20);
        
        // 读取文件
        // 文件来源：1.本地文件。2.网络文件。
        // 路径类
        NSString *str21 = @"http://www.baidu.com";
        // 网络路径
        NSURL *httpURL = [NSURL URLWithString:str21];
        // 本地路径
        NSURL *fileURL = [NSURL fileURLWithPath:str21];
        // 读取网络文件
        NSString *httpStr = [NSString stringWithContentsOfURL:httpURL encoding:NSUTF8StringEncoding error:nil];
        //NSLog(@"httpStr = %@",httpStr);
        // 读取本地文件
        NSString *fileStr = [NSString stringWithContentsOfFile:@"/Users/zc/Desktop/test.txt" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"fileStr = %@",fileStr);
        
        // 写入文件
        NSString *str22 = @"Hello OC";
        BOOL isOk = [str22 writeToFile:@"/Users/zc/Desktop/demo.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if(isOk){
            NSLog(@"文件写入成功");
        }else{
            NSLog(@"文件写入失败");
        }
    }
    return 0;
}
