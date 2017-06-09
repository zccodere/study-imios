//
//  Person.m
//  OCArray
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age{
    Person *person = [[self alloc] init];
    
    person.name = name;
    person.age = age;
    
    return person;
}
// 比较方法
- (NSComparisonResult)comparePerson:(Person *)person{
    return [self.name compare:person.name];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"Person = [ name = %@, age = %zd ]",self.name,self.age];
}

@end
