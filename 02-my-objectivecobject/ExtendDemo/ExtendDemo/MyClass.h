//
//  MyClass.h
//  ExtendDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

//  NSObject：基类
@interface MyClass : NSObject
{
    // 访问修饰符默认是受保护
    @protected
    int _classInt;
    
    // 私有
    @private
    NSString *_classString;
}
@property(nonatomic,strong)NSString *className;

-(void)report;

@end
