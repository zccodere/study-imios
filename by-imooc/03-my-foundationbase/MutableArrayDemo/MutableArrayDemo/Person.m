//
//  Person.m
//  MutableArrayDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if(self){
        _personName = name;
    }
    return self;
}

@end
