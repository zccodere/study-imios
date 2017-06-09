//
//  Mother.h
//  BlockInClass
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mother : NSObject

@property (nonatomic,copy) NSString *name;
// 方式二 使用 Block 作为属性出现 【返回值类型 (^Block名称)(形参)】
@property (nonatomic,copy) void (^actionBlock)();

// 方式一 使用 Block 作为参数类型 形参 【(返回值类型 (^)(形参))Block名称】
- (void)goOutsidWithAction:(void (^)())action;

- (void)cooking;

@end
