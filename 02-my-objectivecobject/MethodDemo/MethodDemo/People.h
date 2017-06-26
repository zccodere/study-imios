//
//  People.h
//  MethodDemo
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

/*
 声明方法
 1、- + 方法的类型
    - 代表对象方法，用对象名来调用
    + 代表类方法，用来来调用
    加号方法和减号方法可以互相调用，当然需要类名和实例化对象。
    加号方法不能调用成员变量，可以调用静态成员变量。
 2、(void) 返回值类型
 
 3、参数
    :(int)x 代表有参数，(int)代表参数类型，x代表参数名称
 4、方法名
    去掉方法类型、去掉参数类型、去掉参数名称，剩下的就是方法名
 */

- (void)report;
/*
+ (void)report1;

- (int)showWithA:(int)a;

// showWithA: andB:
- (int)showWithA:(int)a andB:(int)b;
*/


// 初始化方法
- (instancetype)init;//重写init方法
// 自定义初始化方法
- (instancetype)initWithPeopleName:(NSString *)
peopleName andPeopleAge:(int)peopleAge;


@end
