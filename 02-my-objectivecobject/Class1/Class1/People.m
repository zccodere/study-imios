//
//  People.m
//  Class1
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "People.h"

@implementation People
{
    int _peopleAge;
    int _peopleSex;
}

- (instancetype) init{
    self = [super init];
    if(self){
        // 类内调用成员变量而不是属性，属性是给类外使用的
        _peopleName = @"张三";
    }
    return self;
}

/*
- (void)setName:(NSString *)name{
    _peopleName = name;
}
- (NSString *)getName{
    return _peopleName;
}
*/
@end
