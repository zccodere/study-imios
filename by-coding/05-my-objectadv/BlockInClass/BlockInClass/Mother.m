//
//  Mother.m
//  BlockInClass
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "Mother.h"

@implementation Mother

- (void)goOutsidWithAction:(void (^)())action{
    NSLog(@"Go outside");
    // 调用 Block
    action();
}

- (void)cooking{
    NSLog(@"cooking");
    // 判断 Block 属性是否被实现
    if (self.actionBlock) {
        // 调用 Block 属性
        self.actionBlock();
    }
}

@end
