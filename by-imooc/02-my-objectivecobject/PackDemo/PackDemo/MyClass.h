//
//  MyClass.h
//  PackDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    // 成员变量访问修饰符的问题
    
    // 默认为受保护
    
    // 公有：在类内类外都可以使用并且可以被继承
    @public
    int _classInt;
    
    // 私有：在类内可以使用，类外无法调用并且不可以被继承
    @private
    
    // 受保护：默认：在类内可以使用，类外无法调用并且可以被继承
    @protected
    NSString *_classStr;
    
    // 框架权限：在框架内相当于受保护，在框架外相当于私有
    @package
    
}
@property(nonatomic,strong)NSString *className;

// 方法是没有修饰符的，同C语言一样
- (void)report;

@end
