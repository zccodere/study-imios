//
//  main.m
//  MutableArrayDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 构造演示数据对象
        Person *p1 = [[Person alloc] initWithName:@"张三"];
        Person *p2 = [[Person alloc] initWithName:@"李四"];
        Person *p3 = [[Person alloc] initWithName:@"王五"];
        
        NSArray *personArray = [[NSArray alloc] initWithObjects:p2, p3 , nil];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        // 添加元素
        [array addObject:p1];
        [array addObjectsFromArray:personArray];
        
        NSLog(@"1 %@",array);
        
        // 删除所有元素
        //[array removeAllObjects];
        //NSLog(@"2 %@",array);
        
        // 删除最后一个元素
        //[array removeLastObject];
        //NSLog(@"3 %@",array);
        
        // 删除指定元素
        //[array removeObject:p2];
        //NSLog(@"4 %@",array);
        
        // 删除指定下标元素，注：数组下标越界导致崩溃问题
        //[array removeObjectAtIndex:2];
        //NSLog(@"5 %@",array);
        
        // 交换元素位置
        [array exchangeObjectAtIndex:0 withObjectAtIndex:1];
        NSLog(@"6 %@",array);
    }
    return 0;
}
