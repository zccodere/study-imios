//
//  main.m
//  RuntimeRudiment
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 类似于 Java 的反射
        
        Person *person = [Person person];
        // 动态获取对象的类型
        NSLog(@"对象类型 = %@",[person class]);
        
        Class personClass = person.class;
        unsigned int outCount = 0;
        
        // 遍历实例变量
        Ivar *ivarPtr = class_copyIvarList(personClass, &outCount);
        for (NSInteger i = 0; i < outCount; i++) {
            Ivar ivar = ivarPtr[i];
            NSLog(@"实例变量名称 = %s",ivar_getName(ivar));
        }
        
        // 遍历属性
        objc_property_t *propertyPtr = class_copyPropertyList(personClass, &outCount);
        for (NSInteger i = 0; i < outCount; i++) {
            objc_property_t property = propertyPtr[i];
            NSLog(@"属性名称 = %s",property_getName(property));
        }
        
        // 遍历对象方法
        Method *methodPtr = class_copyMethodList(personClass, &outCount);
        for (NSInteger i = 0; i < outCount; i++) {
            Method method = methodPtr[i];
            SEL selector = method_getName(method);
            
            NSLog(@"对象方法名称 = %@",NSStringFromSelector(selector));
        }
        
        // OC消息发送
        [person setAge:(NSInteger *)10];
        NSLog(@"age = %zd",person.age);
        
        // 是上面 setAge 的底层实现函数
        objc_msgSend(person, @selector(setAge:),15);
        NSLog(@"age = %zd",person.age);
    }
    return 0;
}
