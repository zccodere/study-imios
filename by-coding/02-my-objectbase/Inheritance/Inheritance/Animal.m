//
//  Animal.m
//  Inheritance
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (instancetype)initWithSex:(NSString *)sex age:(NSUInteger)age{
    self = [super init];
    
    if(self){
        _sex = sex;
        _age = age;
        
    }
    return self;
}

// 由子类实现该方法
- (void)eat{}

- (void)bark{}

@end
