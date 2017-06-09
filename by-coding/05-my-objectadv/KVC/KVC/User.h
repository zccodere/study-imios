//
//  User.h
//  KVC
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *company;
@property (nonatomic,strong) NSNumber *age;

@end
