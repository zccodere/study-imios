//
//  Person.h
//  SelfAndSuper
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    NSString *_name;
}

// 使用类方法实例化对象
+ (instancetype)person;

- (void)setName:(NSString *)name;

@end
