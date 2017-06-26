//
//  ViewController.m
//  UIImageView
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
#if 0
    // 5-1
    // UIImage png jpg
    // 图片资源路径
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSString *imagePath = [NSString stringWithFormat:@"%@/1.jpg",path];
    // 以路径形式加载 每一次使用时加载该资源，效率低，但占用内存少
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    // 以名称形式加载 第一次使用时加载进内存，效率高，但占用内存多
    //UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    
    // 载体
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    // 图片显示在屏幕上的大小是有载体控制
    //imageView.frame = CGRectMake(0, 30, image.size.height, image.size.width);
    imageView.frame = CGRectMake(0, 20, 240, 320);
    [self.view addSubview:imageView];
    
    // 5-2
    // 内容模式
    //imageView.contentMode = UIViewContentModeCenter;//居中
    //imageView.contentMode = UIViewContentModeScaleToFill;//拉伸-充满整个载体
    imageView.contentMode = UIViewContentModeScaleAspectFill;//拉伸-不改变比例，充满最大的边
    //imageView.contentMode = UIViewContentModeScaleAspectFit;//拉伸-不改变比例，充满最小的边
#endif
    // 5-3
    // UIImageView动画 播放序列图
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for(int i=1;i<=13;i++){
        UIImage *imageTemp = [UIImage imageNamed:[NSString stringWithFormat:@"png%d.png",i]];
        [imageArray addObject:imageTemp];
    }
    
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.frame = CGRectMake((self.view.frame.size.width-407)/2, 100, 407, 217);
    // 设置动画数组
    imageView2.animationImages = imageArray;
    // 设置全部图片播放周期时间（单位：秒）
    imageView2.animationDuration = 2;
    // 播放多少次 执行次数（0：不限制次数）
    imageView2.animationRepeatCount = 10;
    // 开始播放动画
    [imageView2 startAnimating];
    // 停止播放动画
    //[imageView2 stopAnimating];
    [self.view addSubview:imageView2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
