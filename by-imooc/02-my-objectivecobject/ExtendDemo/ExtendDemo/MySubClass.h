//
//  MySubClass.h
//  ExtendDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

// 引用父类头文件
#import "MyClass.h"

// interface时候，冒号（:）代表继承关系
@interface MySubClass : MyClass

- (void)show;

@end
