//
//  ViewController.m
//  UILable
//
//  Created by zc on 2017/5/15.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.view.backgroundColor = [UIColor redColor];
    
    //4-1
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(10, 100, 350, 300);
    lable.backgroundColor = [UIColor yellowColor];
    // 文本
    lable.text = @"网提供了丰富的移动端开发、php开发、web前端、html5教程以及css3视频教程等课程资源。它富有交互性及趣味性,并且你.网提供了丰富的移动端开发、php开发、web前端、html5教程以及css3视频教程等课程资源。它富有交互性及趣味性,并且你.网提供了丰富的移动端开发、php开发、web前端、html5教程以及css3视频教程等课程资源。它富有交互性及趣味性,并且你.";
    // 文字布局模式
    lable.textAlignment = NSTextAlignmentCenter;
    // 文字的颜色
    //lable.textColor = [UIColor clearColor];//clearColor 透明色
    lable.textColor = [UIColor colorWithRed:0.1 green:0.8 blue:0.2 alpha:1];
    // alpha 透明度
    //lable.alpha = 0.5;
    
    //4-2
    // 字体的设置
    lable.font = [UIFont systemFontOfSize:25];
    // 加粗或倾斜
    lable.font = [UIFont boldSystemFontOfSize:25];
    lable.font = [UIFont italicSystemFontOfSize:25];
    // 遍历系统已安装的字体
    for(NSString *name in [UIFont familyNames]){
        NSLog(@"fontName:%@",name);
    }
    // 设置字体和大小
    lable.font = [UIFont fontWithName:@"Bodoni 72" size:20];
    // 设置阴影
    //lable.shadowColor = [UIColor redColor];
    //lable.shadowOffset = CGSizeMake(-2, -2);
    
    // 处理多文字
    // 1.Label要有足够的大小
    // 2.设置换行模式
    lable.lineBreakMode = NSLineBreakByCharWrapping;
    // 3.设置显示行数（0或-1不限制行数）
    lable.numberOfLines = 0;
    
    //4-3
    // 根据字符串大小计算Label的大小
    CGSize size = [lable.text sizeWithFont:lable.font constrainedToSize:CGSizeMake(355, 10000) lineBreakMode:NSLineBreakByCharWrapping];
    lable.frame = CGRectMake(lable.frame.origin.x, lable.frame.origin.y, lable.frame.size.width, size.height);
    
    [self.view addSubview:lable];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
