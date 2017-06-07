//
//  KeyValueView.m
//  MyWebRequestTest
//
//  Created by zc on 2017/5/23.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "KeyValueView.h"

@implementation KeyValueView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 重写初始化方法
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)/3, CGRectGetHeight(self.frame))];
        _keyLabel.backgroundColor = [UIColor clearColor];
        _keyLabel.textAlignment = NSTextAlignmentLeft;
        _keyLabel.font = [UIFont systemFontOfSize:16];
        _keyLabel.textColor = [UIColor blackColor];
        [self addSubview:_keyLabel];
        
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/3, 0, 2*CGRectGetWidth(self.frame)/3, CGRectGetHeight(self.frame))];
        _valueLabel.backgroundColor = [UIColor clearColor];
        _valueLabel.textAlignment = NSTextAlignmentLeft;
        _valueLabel.font = [UIFont systemFontOfSize:16];
        _valueLabel.textColor = [UIColor blackColor];
        [self addSubview:_valueLabel];
    }
    return self;
}

// 实现对象方法 设置 key和value的值
-(void)setupKey:(NSString *)key value:(NSString *)value{
    [_keyLabel setText:key];
    [_valueLabel setText:value];
}

@end
