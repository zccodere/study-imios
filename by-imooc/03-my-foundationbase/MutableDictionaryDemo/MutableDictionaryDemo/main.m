//
//  main.m
//  MutableDictionaryDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        
        // 添加键值对
        [dict setObject:@"1" forKey:@"a"];
        [dict setObject:@"2" forKey:@"b"];
        
        // 删除所有键值对
        //[dict removeAllObjects];
        //NSLog(@"1 dict = %@",dict);
        
        // 删除指定键值对
        [dict removeObjectForKey:@"b"];
        NSLog(@"2 dict = %@",dict);
    }
    return 0;
}
