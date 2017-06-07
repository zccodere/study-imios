//
//  UserInfoViewController.h
//  MyWebRequestTest
//
//  Created by zc on 2017/5/23.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyValueView.h"

@interface UserInfoViewController : UIViewController

@property(nonatomic, strong) KeyValueView *userNameView;// 属性 用户名
@property(nonatomic, strong) KeyValueView *userSexView;// 属性 性别
@property(nonatomic, strong) KeyValueView *userBirthdayView;// 属性 生日
@property(nonatomic, strong) KeyValueView *userEmailView;// 属性 邮箱
@property(nonatomic, strong) KeyValueView *userPhoneView;// 属性 手机

@end
