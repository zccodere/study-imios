//
//  Person.h
//  RuntimeRudiment
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger *age;

+ (instancetype)person;

@end
