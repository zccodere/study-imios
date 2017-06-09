//
//  Person.h
//  SetterAndGetter
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
    NSUInteger _age;
    NSString *_sex;
}

- (void)setName:(NSString *)name;
- (void)setAge:(NSUInteger)age;
- (void)setSex:(NSString *)sex;

- (NSString *)name;
- (NSUInteger)age;
- (NSString *)sex;

@end
