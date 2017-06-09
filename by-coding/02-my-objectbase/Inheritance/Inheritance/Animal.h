//
//  Animal.h
//  Inheritance
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    @protected //（默认）
//    @private
//    @public
    NSString *_sex;
    NSUInteger _age;
    NSString *_name;
}

// 属性生成器生成的成员变量默认是私有的，当成员变量里面有 @protected 时，会自动变成 受保护的
@property (nonatomic,copy) NSString *name;

- (instancetype)initWithSex:(NSString *)sex age:(NSUInteger)age;

- (void)eat;

- (void)bark;

@end
