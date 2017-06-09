//
//  Person.h
//  Archiver
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

// 遵循 NSCoding 协议
@interface Person : NSObject<NSCoding>

@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSUInteger *age;
@property(nonatomic,copy) NSString *sex;

@end
