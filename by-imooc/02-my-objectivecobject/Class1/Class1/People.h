//
//  People.h
//  Class1
//
//  Created by zc on 2017/4/28.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

// 类内使用成员变量、类外使用属性
// 姓名、年龄、性别
#import <Foundation/Foundation.h>

@interface People : NSObject
/*
{	
    NSString *_peopleName;
    int _peopleAge;
    int _peopleSex;
}
*/
// 为了让类外可以访问成员变量
// 属性就是成员变量的外部接口
@property(nonatomic,strong)NSString *peopleName;

//- (void)setName:(NSString *)name;
//- (NSString *)getName;
@end
