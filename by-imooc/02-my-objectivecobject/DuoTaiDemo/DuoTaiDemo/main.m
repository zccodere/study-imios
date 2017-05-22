//
//  main.m
//  DuoTaiDemo
//
//  Created by zc on 2017/5/10.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorPrinter.h"
#import "BlackPrinter.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ColorPrinter *cp = [[ColorPrinter alloc] init];
        
        BlackPrinter *bp = [[BlackPrinter alloc] init];
        
        [cp print];
        
        [bp print];
        
        Printer *printer = [[ColorPrinter alloc] init];
        [printer print];
        
    }
    return 0;
}
