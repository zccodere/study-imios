//
//  Person.m
//  SetterAndGetter
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Person.h"

@implementation Person

// 让 _name 和 Person 的生命周期同步
- (void)dealloc{
    // 当使用 mrc 内存管理方式时，需考虑内存泄漏问题
    [_name release];
    [_sex release];
    [super dealloc];
}

- (void)setName:(NSString *)name{
    //_name = name;
    
    // 当第二次赋值与当前值相等时，减少执行重复操作
    if(name != _name){
        // 先释放上一次引用的对象
        [_name release];
        // 调用 retain 方法进行对象强引用，保证对象使用期间，对象一致存在
        _name = [name retain];
    }
}
- (void)setAge:(NSUInteger)age{
    _age = age;
}
- (void)setSex:(NSString *)sex{
    //_sex = sex;
    
    // 当第二次赋值与当前值相等时，减少执行重复操作
    if(sex != _sex){
        // 先释放上一次引用的对象
        [_sex release];
        // 调用 retain 方法进行对象强引用，保证对象使用期间，对象一致存在
        _sex = [sex retain];
    }
}

- (NSString *)name{
    return _name;
}
- (NSUInteger)age{
    return _age;
}
- (NSString *)sex{
    return _sex;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"Person = [ name = %@, age = %zd, sex = %@ ]",_name,_age,_sex];
}

@end
