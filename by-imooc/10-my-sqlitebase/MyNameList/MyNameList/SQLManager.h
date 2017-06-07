//
//  SQLManager.h
//  MyNameList
//
//  Created by zc on 2017/6/5.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "StudentModel.h"

@interface SQLManager : NSObject{
    sqlite3 *db;
}

+ (SQLManager *)shareManager;

- (StudentModel *)searchWithIdNum:(StudentModel *)model;

- (int)insert:(StudentModel *)model;

@end
