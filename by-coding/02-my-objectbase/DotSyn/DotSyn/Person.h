//
//  Person.h
//  DotSyn
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

@end
