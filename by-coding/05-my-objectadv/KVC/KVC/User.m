//
//  User.m
//  KVC
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "User.h"

// 匿名类别
@interface User ()

@property (nonatomic,copy) NSString *sex;

@end

@implementation User

- (NSString *)description
{
    return [NSString stringWithFormat:@"User = [ username = %@, company = %@, age = %@, sex = %@]", _username,_company,_age,_sex];
}

@end
