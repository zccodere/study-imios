//
//  Person.m
//  Archiver
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

// 重写 initWithCoder 方法，进行接档
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
        _name = [coder decodeObjectForKey:@"name"];
        _age = (NSUInteger *)[coder decodeIntegerForKey:@"age"];
        _sex = [coder decodeObjectForKey:@"sex"];
        
    }
    return self;
}

// 重写 encodeWithCoder 方法，进行归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeInteger:(NSInteger)_age forKey:@"age"];
    [coder encodeObject:_sex forKey:@"sex"];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Person = [ name = %@, age = %zd, sex = %@]", _name,_age,_sex];
}

@end
