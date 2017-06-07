//
//  ViewController.m
//  MyBrowser
//
//  Created by zc on 2017/6/2.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor colorWithRed:0.776 green:0.776 blue:0.8 alpha:1.0]];
    
    // 创建并初始化搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 34,self.view.frame.size.width - 15 * 2 -60, 44)];
    // 提示文字
    _searchBar.placeholder = @"http://www.baidu.com";
    _searchBar.backgroundColor = [UIColor clearColor];
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
    
    // 创建并初始化搜索按钮
    _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(_searchBar.frame.origin.x + _searchBar.frame.size.width + 10, 41, 60, 30)];
    _searchButton.backgroundColor = [UIColor clearColor];
    [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _searchButton.layer.cornerRadius = 5.0;
    _searchButton.layer.borderColor = [UIColor blackColor].CGColor;
    _searchButton.layer.borderWidth = 1.0;
    // 添加事件
    [_searchButton addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];

    // 创建并初始化网页
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 85, self.view.frame.size.width, self.view.frame.size.height - 85)];
    _webView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_webView];
    
}

// 搜索按钮点击事件
- (void)searchAction:(id)sender{
    NSLog(@"搜索按钮点击");
    [self loadWebContent];

}

// 接收点击键盘搜索按钮的回调
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarSearchButtonClicked");
    [self loadWebContent];

}

// 加载网页内容
- (void) loadWebContent{
    
    // 释放第一响应者，收起键盘
    [_searchBar resignFirstResponder];
    
    NSString *urlText = [_searchBar text];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"正在加载:%@",urlText);
    [_webView loadRequest:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
