//
//  ViewController.m
//  UIView
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
    
    // 3-1
    // 创建视图
    UIView *view1 = [[UIView alloc] init];
    // 设置边框-位置大小
    view1.frame = CGRectMake(10, 30, 394, 696);
    // 背景颜色
    view1.backgroundColor = [UIColor redColor];
    // 将视图加入到父视图中
    [self.view addSubview:view1];
    
    /*
     机型  屏幕尺寸 分辨率 倍率  图片分辨率
     3GS  3.5寸 320*480 @1x
     4/4s 3.5寸 320*480 @2x 640*960
     5/5c/5s 4.0寸 320*568 @2x 640*1136
     6    4.7寸 375*667 @2x 750*1334
     6plus 5.5寸 414*736 @3x 1242*2208
     
     */
    
    // 3-2
    // 获取当前屏幕
    
    int width = [[UIScreen mainScreen] bounds].size.width;
    int height = [[UIScreen mainScreen] bounds].size.height;
    NSLog(@"width:%d height:%d",width,height);
    
    // 3-3
    // 状态栏高度为20px，我们在设置控件frame时需要让出20px。
    NSLog(@"x:%f y:%f w:%f h:%f",view1.frame.origin.x,view1.frame.origin.y,view1.frame.size.width,view1.frame.size.height);
    
    // bounds 边框大小，x和y永远为0
    NSLog(@"x:%f y:%f w:%f h:%f",view1.bounds.origin.x,view1.bounds.origin.y,view1.bounds.size.width,view1.bounds.size.height);
    
    // center 中心点
    NSLog(@"x:%f y:%f",view1.center.x,view1.center.y);
    
    // 3-4
    // 父视图
    UIView *superView = view1.superview;
    superView.backgroundColor = [UIColor greenColor];
    // 坐标是根据父视图的位置来设置的，不会垮层
    UIView *view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(10, 100, 300, 30);
    view2.backgroundColor = [UIColor blackColor];
    // 视图唯一标识
    view2.tag = 2;
    [view1 addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.frame = CGRectMake(20, 50, 100, 100);
    view3.backgroundColor = [UIColor purpleColor];
    // 视图唯一标识
    view3.tag = 3;
    [view1 addSubview:view3];
    
    // 子视图
    // 方式一：获取全部子视图
    NSArray *subViewArray = view1.subviews;
    for (UIView *viewTemp in subViewArray) {
        
        if(viewTemp.tag == 2){
            viewTemp.backgroundColor = [UIColor whiteColor];
        }
    }
    
    // 方式二：通过tag值获取对应的子视图
    UIView *subView = [view1 viewWithTag:3];
    subView.backgroundColor = [UIColor orangeColor];
    
    //3-5
    // 层级的处理
    /* 
     1.同一个父视图中先加入的View会被盖在下面
     2.子视图是跟随父视图进行层级遮挡，如果父视图低于其它同级视图，则父视图的子视图也会被盖住，但是子视图和其它视图的子视图是没有关系的
     3.交换两个层的视图时需要注意必须填写正确的层级数
     4.当层交换了之后对应子视图的数组下标也会进行改变
     */
    
    UIView *view4 = [[UIView alloc] init];
    view4.frame = CGRectMake(10, 100, 300, 300);
    view4.backgroundColor = [UIColor yellowColor];
    //[self.view addSubview:view4];
    
    // 交换两个层的视图
    [view1 exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    // 插入一个视图到指定层
    UIView *view5 = [[UIView alloc] init];
    view5.frame = CGRectMake(7, 80, 200, 200);
    view5.backgroundColor = [UIColor blackColor];
    //[view1 insertSubview:view5 atIndex:2];//插入一个视图到指定层
    //[view1 insertSubview:view5 aboveSubview:view3];//插入一个视图到指定视图的上面
    [view1 insertSubview:view5 belowSubview:view2];//插入一个视图到指定视图的下面
    // 将一个View放入最顶层或者最底层
    // 最顶层
    [view1 bringSubviewToFront:view3];
    // 最底层
    [view1 sendSubviewToBack:view3];
    
    //3-6
    // 自适应
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-25, 400, 50, 50);
    // 准许子视图自适应
    backView.autoresizesSubviews = YES;
    backView.tag = 1001;
    backView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:backView];
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(10, 10, 30, 30);
    topView.backgroundColor = [UIColor greenColor];
    // 设置子视图的适应方式
    topView.autoresizingMask =
//        UIViewAutoresizingFlexibleRightMargin |
//        UIViewAutoresizingFlexibleLeftMargin |
//        UIViewAutoresizingFlexibleTopMargin |
//        UIViewAutoresizingFlexibleBottomMargin |
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    [backView addSubview:topView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 550, 355, 30);
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(bntClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)bntClick {
    UIView *view = [self.view viewWithTag:1001];
    view.frame = CGRectMake(view.frame.origin.x-5, view.frame.origin.y-5, view.frame.size.width+10, view.frame.size.height+10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
