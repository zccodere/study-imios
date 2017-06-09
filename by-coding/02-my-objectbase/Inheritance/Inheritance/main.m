//
//  main.m
//  Inheritance
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Animal *animal = [[Animal alloc] initWithSex:@"male" age:1];
        [animal eat];
        
        Dog *dog = [[Dog alloc] initWithSex:@"female" age:5];
        dog.name = @"Tom";
        [dog eat];
        
        // 父类的指针指向子类的对象
        animal = [[Cat alloc] initWithSex:@"male" age:10];
        animal.name = @"kitty";
        [animal eat];
        NSLog(@"animal = %@",animal);
        
//        Dog *animal1 = [[Animal alloc] init];
//        [animal run];
    }
    return 0;
}
