//
//  ArrayTest.m
//  OCArray
//
//  Created by zhangcheng on 2017/6/9.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "ArrayTest.h"
#import "Person.h"

@implementation ArrayTest

+ (void)test{
    
    //[self createArray];
    //[self traverseArray];
    //[self sortArray];
    //[self otherMethods];
    [self mutableArray];
}

// 创建不可变数组
+ (void)createArray{
    
    // 方式一
    NSArray *array = [[NSArray alloc] initWithObjects:@"one",@"two",@"three", nil];
    NSLog(@"array = %@",array);
    NSLog(@"array length = %zd",array.count);
    
    // 方式二
    array = @[@"1",@"2",@"3",@"4"];
    NSLog(@"array = %@",array);
    NSLog(@"array length = %zd",array.count);
    
    NSNumber *number = @1.1;
    // 方式三
    array = [NSArray arrayWithObjects:@"one",array,number, nil];
    NSLog(@"array = %@",array);
    NSLog(@"array length = %zd",array.count);
    
    NSArray *subArray = [array objectAtIndex:1];
    NSLog(@"subArray = %@",subArray);
    
    id object = array[0];
    NSLog(@"array[0] = %@",object);
}

// 遍历数组
+ (void)traverseArray{
    
    NSArray *array = @[@"1",@"2",@"3",@"4"];
    
    // 方式一 普通for循环
    for (NSInteger i = 0; i < array.count; i++) {
        NSLog(@"for array[%zd] = %@",i,array[i]);
    }
    // 方式二 快速for in循环
    for (NSString *object in array) {
        NSLog(@"for in object = %@",object);
    }
    
    // 方式三 枚举器
    NSEnumerator *enumerator = [array objectEnumerator];
    id object = [enumerator nextObject];
    while (object) {
        NSLog(@"enumerator object = %@",object);
        object = [enumerator nextObject];
    }
    
}

// 数组排序
+ (void)sortArray{
    NSArray *array = @[@"5",@"3",@"4",@"1",@"2"];
    
    // 方式一
    NSArray *resultArray = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"resultArray = %@",resultArray);
    
    Person *person1 = [Person personWithName:@"xiaohong" age:2];
    Person *person2 = [Person personWithName:@"tom" age:14];
    Person *person3 = [Person personWithName:@"xiaohong" age:20];
    Person *person4 = [Person personWithName:@"chenglong" age:30];
    Person *person5 = [Person personWithName:@"tim" age:5];
    
    // 方式二 对自定义对象进行排序
    NSArray *personArray = @[person1,person2,person3,person4,person5];
    resultArray = [personArray sortedArrayUsingSelector:@selector(comparePerson:)];
    NSLog(@"resultArray = %@",resultArray);
    
    // 方式三 使用排序描述器
    // 定义描述规则 Desc 降序 Aec 升序
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    NSSortDescriptor *sortByAgeDesc = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    resultArray = [personArray sortedArrayUsingDescriptors:@[sortByNameDesc,sortByAgeDesc]];
    NSLog(@"resultArray = %@",resultArray);
}

// 数组其它方法
+ (void)otherMethods{
    
    NSArray *array = @[@"1",@"2",@"3",@"4"];
    
    NSLog(@"array first object = %@",[array firstObject]);
    NSLog(@"array last object = %@",array.lastObject);
    
    // 字符串转数组
    NSString *string = @"i love u";
    NSArray *array1 = [string componentsSeparatedByString:@" "];
    NSLog(@"array1 = %@",array1);
    
    NSString *string1 = [array1 componentsJoinedByString:@"-"];
    NSLog(@"string1 = %@",string1);

}

// 可变数组
+ (void)mutableArray{
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:@1];
    [array addObject:@"one"];
    NSLog(@"array = %@",array);
    
    [array insertObject:@2 atIndex:array.count-1];
    NSLog(@"array = %@",array);
    
    [array removeObject:@2];
    NSLog(@"array = %@",array);
    
    [array addObject:@"two"];
    [array addObject:@"two"];
    [array addObject:@"two"];
    [array addObject:@"two"];
    [array addObject:@"two"];
    NSLog(@"array = %@",array);
    
    [array removeObject:@"two"];
//    [array removeAllObjects];
    NSLog(@"array = %@",array);
    
    [array replaceObjectAtIndex:1 withObject:@2];
    NSLog(@"array = %@",array);
}

@end
