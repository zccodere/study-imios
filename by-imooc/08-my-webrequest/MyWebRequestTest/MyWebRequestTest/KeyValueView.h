//
//  KeyValueView.h
//  MyWebRequestTest
//
//  Created by zc on 2017/5/23.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KeyValueView : UIView

// 属性 key字段
@property (nonatomic,strong) UILabel *keyLabel;
// 属性 value字段
@property (nonatomic,strong) UILabel *valueLabel;

// 声明对象方法 设置 key和value的值
- (void)setupKey:(NSString *)key value:(NSString *)value;

@end
