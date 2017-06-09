//
//  CopyTest.m
//  OCCopy
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "CopyTest.h"

@implementation CopyTest

+ (void)test{

    [self copyOper];
    
}
/*
 浅拷贝
    1.不创新的内存控制，不复制对象的内容，指向旧的内存地址
    2.操作任何一个对象，另一个对象也会改变
 深拷贝
    1.创建新的内存空间，并复制对象的内容，指向新的内存地址
    2.操作任何一个对象，另一个对象不会改变
 */
// Copy 浅拷贝 和 深拷贝
+ (void)copyOper{

    NSString *string1 = @"string";
    NSLog(@"&string1 = %p, string1 = %@",string1,string1);
    
    // 当 copy 不可变对象 为 不可变对象时，进行浅拷贝，返回 不可变对象
    NSString *string2 = [string1 copy];
    NSLog(@"&string2 = %p, string2 = %@",string2,string2);
    
    NSMutableString *muntableString1 = [NSMutableString stringWithString:string1];
    NSLog(@"&muntableString1 = %p, muntableString1 = %@",muntableString1,muntableString1);
    
    // 当 copy 可变对象 为 不可变对象时，进行深拷贝，返回 不可变对象
    NSString *string3 = [muntableString1 copy];
    NSLog(@"&string3 = %p, string3 = %@",string3,string3);
    
    // 当 mutableCopy 不可变对象 为 可变对象时，进行深拷贝，返回 可变对象
    NSMutableString *muntableStringCopy = [string1 mutableCopy];
    NSLog(@"&muntableStringCopy = %p, muntableStringCopy = %@",muntableStringCopy,muntableStringCopy);
    
    // 当 mutableCopy 可变对象 为 可变对象时，进行深拷贝，返回 可变对象
    muntableStringCopy = [muntableString1 mutableCopy];
    NSLog(@"&muntableStringCopy = %p, muntableStringCopy = %@",muntableStringCopy,muntableStringCopy);

}

@end
