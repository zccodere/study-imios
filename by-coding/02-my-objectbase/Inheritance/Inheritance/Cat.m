//
//  Cat.m
//  Inheritance
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (void)eat{
    NSLog(@"eat food");
}

- (NSString *)description{
    return [NSString stringWithFormat:@"Cat = [ sex = %@, age = %zd, name = %@ ]",_sex,_age,_name];
}

@end
