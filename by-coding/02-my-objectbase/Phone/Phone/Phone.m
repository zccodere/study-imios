//
//  Phone.m
//  Phone
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Phone.h"

// 类实现
@implementation Phone

// 方法实现 打电话
- (void)makeCallToSomeone:(NSString *)someone{
    NSLog(@"给 %@ 打电话",someone);
}
// 方法实现 发信息
- (void)sendMessage:(NSString *)message toReceiver:(NSString *)receiver{
    NSLog(@"给 %@ 发信息，信息：%@",receiver,message);
}

// 重写父类的 description 方法 类似 Java 中的 toString 方法
- (NSString *)description{
    return [NSString stringWithFormat:@"手机信息[屏幕尺寸：%f，机身颜色：%@，内存大小：%fM]",_screenSize,_color,_memory];
}

@end
