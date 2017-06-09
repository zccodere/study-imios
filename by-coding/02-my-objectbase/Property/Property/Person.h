//
//  Person.h
//  Property
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 属性约束
 1.线程安全相关（原子性）
    》atomic（原子操作）（默认）
    》nonatomic（非原子操作）
    一般情况下，都使用nonatomic，可以提高程序的执行效率
 2.内存管理相关
    》MRC下，retain（强引用），copy（强引用），assign（弱引用，赋值，默认）
    》ARC下，strong（强引用），weak（弱引用）
 3.读写属性相关
    》readwrite（同时生成 setter 和 getter 方法）（默认）
    》readonly（只会生成 getter 方法）
 4.重命名相关
    》setter 方法重命名，方法名称后必须附带一个
    》getter 方法重命名
 
*/

@interface Person : NSObject
//{
//    // 成员变量
//    NSString *_name;
//    NSUInteger _age;
//    NSString *_sex;
//}

// 属性生成器 自动生成 成员变量 和 set 和 get 方法
// 1.使用属性生成器后，不需要再写成员变量了
// 2.使用属性生成器后，不需要再写 set 和 get 方法了
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSUInteger age;
@property (nonatomic,copy) NSString *sex;

@end
