//
//  PersonMe.m
//  SelfAndSuper
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "PersonMe.h"

@implementation PersonMe

//+ (instancetype)person{
//    PersonMe *personMe = [[self alloc] init];
//    
//    return personMe;
//}

- (void)setName:(NSString *)name{

    _name = name;
    
    
}

- (void)test{
    [self setName:@"Tom"];
    [super setName:@"Tom"];
}

@end
