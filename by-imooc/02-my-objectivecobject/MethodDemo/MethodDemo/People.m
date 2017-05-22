//
//  People.m
//  MethodDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "People.h"

@implementation People
{
    // 成员变量
    NSString *_peopleName;
    int _peopleAge;
}

// 静态成员变量
static NSString *_peopleName1;

- (void)report{
//    NSLog(@"-号：report");
//    //[People report1];
//    _peopleName = @"123";
    NSLog(@"peopleName = %@",_peopleName);
    NSLog(@"peopleName = %d",_peopleAge);


}

+ (void)report1{
    NSLog(@"+号：report1");
    [[People alloc] report];
    _peopleName1 = @"张三";
}

- (int)showWithA:(int)a{
    return a;
}

- (int)showWithA:(int)a andB:(int)b{
    return a+b;
}

// 重写初始化方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        _peopleName = @"Visitor";
        _peopleAge = 30;
    }
    return self;
}

- (instancetype)initWithPeopleName:(NSString *)
peopleName andPeopleAge:(int)peopleAge{
    self = [super init];
    if(self){
        _peopleName = peopleName;
        _peopleAge = peopleAge;
    }
    return self;
}


@end
