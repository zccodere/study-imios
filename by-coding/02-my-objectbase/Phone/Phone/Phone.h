//
//  Phone.h
//  Phone
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

// 类声明
@interface Phone : NSObject
{
    // 成员变量 默认受保护 外部无法访问
    // 使用 @public 修饰的成员变量 外部可以访问
    @public
    CGFloat _screenSize;//屏幕尺寸
    NSString *_color;//颜色
    CGFloat _memory;//内存

}

// 对象方法
// 方法签名 打电话
- (void)makeCallToSomeone:(NSString *)someone;
// 方法签名 发信息
- (void)sendMessage:(NSString *)message toReceiver:(NSString *)receiver;
@end
