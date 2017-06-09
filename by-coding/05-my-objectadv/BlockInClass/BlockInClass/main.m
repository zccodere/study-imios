//
//  main.m
//  BlockInClass
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mother.h"
#import "OldWoman.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 通过 Block 实现完成两个不同类之间对象的通信 耦合度非常低
        
        Mother *mother = [[Mother alloc] init];
        
        OldWoman *oldWoman = [[OldWoman alloc] init];
        
        // 方式二 使用 Block 作为形参
        // 实现 Block
        [mother goOutsidWithAction:^{
            [oldWoman lookAfterBaby];
        }];
        
        // 方式一 使用 Block 作为属性
        // 实现 Block
        [mother setActionBlock:^{
            [oldWoman lookAfterBaby];
        }];
        
        [mother cooking];
    }
    return 0;
}
