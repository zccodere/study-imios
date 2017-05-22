//
//  main.m
//  ArrayDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 3-1 NSArray(上)
        
        // OC的数组可以存储不同类型的对象，OC的数组只能存储对象
        NSArray *array1 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
        // 数组的长度
        int count = (int)array1.count;
        NSLog(@"count = %d",count);
        // 判断数组中是否包含对应的对象
        BOOL isHave = [array1 containsObject:@"2"];
        if(isHave){
            NSLog(@"存在");
        }else{
            NSLog(@"不存在");
        }
        // 获取数组中最后一个元素
        NSString *str = [array1 lastObject];
        NSLog(@"str = %@",str);
        // 获取数组中首个元素
        str = [array1 firstObject];
        NSLog(@"str = %@",str);
        // 获取数组中下标为3的元素
        str = [array1 objectAtIndex:3];
        NSLog(@"str = %@",str);
        // 获取元素对应的下标，如果元素不存在，则返回-1
        int index = (int)[array1 indexOfObject:@"3"];
        NSLog(@"index = %d",index);
        
        
        // 3-1 NSArray(下)
        
        // 数组的遍历
        // 1.基本的for循环，通过下标逐一取出查看
        for(int i=0;i<array1.count;i++){
            NSLog(@"array[%d] = %@",i,[array1 objectAtIndex:i]);
        }
        
        // 2.使用for in快速枚举。注：数组类型需一致
        int i = 0;
        for (NSString *strTemp in array1){
            NSLog(@"array[%d] = %@",i++,strTemp);
        }
        
        // 3.枚举器也叫迭代器
        NSEnumerator *en = [array1 objectEnumerator];
        id obj;
        i = 0;
        while (obj = [en nextObject]){
            NSLog(@"array[%d] = %@",i++,obj);
        }
        
        
    }
    return 0;
}
