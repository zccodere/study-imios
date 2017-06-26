//
//  Person.h
//  MutableArrayDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,strong)NSString *personName;

- (instancetype)initWithName:(NSString *)name;

@end
