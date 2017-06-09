//
//  main.m
//  SelfAndSuper
//
//  Created by zhangcheng on 2017/6/8.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "PersonMe.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [Person person];
        [person setName:@"Tom"];
        
        PersonMe *personMe = [PersonMe person];
        
        [personMe test];
        
    }
    return 0;
}
