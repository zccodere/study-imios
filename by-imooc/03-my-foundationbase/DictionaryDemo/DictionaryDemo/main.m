//
//  main.m
//  DictionaryDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         字典
         存储的内存不是连续的
         用key和value进行对应（键值）
         kvc 键值编码
         */
        // 创建单个键值对字典
        NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
        NSLog(@"dict1 = %@",dict1);
        // 创建多个键值对字典
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1", @"2", @"3", nil] forKeys:[NSArray arrayWithObjects:@"a", @"b", @"c", nil]];
        NSLog(@"dict2 = %@",dict2);
        // 简便写法，注：key 在前，value 在后。
        NSDictionary *dict3 = @{@"1":@"a", @"2":@"b"};
        NSLog(@"dict3 = %@",dict3);
        
        // 获取字典的长度
        int count = (int)[dict2 count];
        NSLog(@"count = %d",count);
        
        // 获取字典中指定键的值
        NSString *value1 = [dict2 valueForKey:@"b"];
        NSLog(@"value1 = %@",value1);
        
        // 获取字典中指定键的值
        NSString *value2 = [dict2 objectForKey:@"b"];
        NSLog(@"value2 = %@",value2);
        
        // 获取字典中所有的值
        NSArray *allValues = [dict2 allValues];
        NSLog(@"allValues = %@",allValues);
        
        // 获取字典中所有的键
        NSArray *allKeys = [dict2 allKeys];
        NSLog(@"allKeys = %@",allKeys);
        
        // 获取指定值的键，当字典中不存在指定值时，返回指定的标记
        NSArray *array = [dict2 objectsForKeys:[NSArray arrayWithObjects: @"a", @"b", @"d", nil] notFoundMarker:@"not fount"];
        NSLog(@"array = %@",array);
        
        // 遍历字典
        for(NSString *key in dict2){
            NSLog(@"%@ = %@",key,[dict2 valueForKey:key]);
        }
        
        // 使用迭代器遍历字典
        NSEnumerator *en = [dict2 keyEnumerator];
        id key = nil;
        while (key = [en nextObject]){
            NSLog(@"%@ = %@",key,[dict2 valueForKey:key]);
        }
    }
    return 0;
}
