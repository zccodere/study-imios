//
//  ViewController.m
//  MyJson-1-iOS
//
//  Created by zc on 2017/6/2.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 解析按钮点击事件
- (IBAction)onParseJson:(id)sender {
    [self jsonOnUrl];
}

/*
 iOS5+自带JSON操作库
 
 数据解析：
 要求：1.从文件读取json数据并解析，文件名称weatherinfo.json
 2.从网络读取json数据并解析，http://www.weather.com.cn/data/cityinfo/101010100.html
 目的：掌握通过NSJSONSerialization类解析来自文件和网络的JSON数据
 重点：掌握静态函数JSONObjectWithData：options：error：的使用，灵活掌握json的数据源读取技巧
 */
// 解析JSON数据从文件
- (void)jsonOnFile{
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"weatherinfo" ofType:@"json"];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    NSString *jsonStr;
    
    if([fileMgr fileExistsAtPath:filePath]){
        
        jsonStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        
    }else{
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"文件没有找到"];
        return;
    }
    
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    // 判断对象数据类型
    if([jsonObj isKindOfClass:[NSDictionary class]]){
        // 字典类型
        NSDictionary *dic1 = (NSDictionary *)jsonObj;
        NSDictionary *dic = [dic1 objectForKey:@"weatherinfo"];
        
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"city"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"temp1"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"temp2"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"weather"]];
        
    }
    if([jsonObj isKindOfClass:[NSArray class]]){
        // 数组类型
        NSArray *arr = (NSArray *)jsonObj;
        
        for (NSDictionary *dic in arr){
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"name"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        }
    }
    
}

/*
 iOS5+自带JSON操作库
 
 数据解析：
    要求：1.从文件读取json数据并解析，文件名称weatherinfo.json
         2.从网络读取json数据并解析，http://www.weather.com.cn/data/cityinfo/101010100.html
    目的：掌握通过NSJSONSerialization类解析来自文件和网络的JSON数据
    重点：掌握静态函数JSONObjectWithData：options：error：的使用，灵活掌握json的数据源读取技巧
 */
// 解析JSON数据从文件
- (void)jsonOnUrl{
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
    
    // 加载网络资源方式一
    NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101010100.html"];
    //NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    // 加载网络资源方式二
    NSString *jsonStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    
    // 加载网络资源方式三
    /*
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    // 根据会话对象，创建一个Task任务
    NSURLSessionTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        // 解析响应数据
        //NSLog(@"从服务器获取到数据,响应消息：%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        // 解析JOSN数据
        id obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //NSLog(@"从服务器获取到数据,响应消息：%@",obj);
        // 如果obj是 字典类型
        if([obj isKindOfClass:[NSDictionary class]]){
            NSDictionary *weatherinfo = [(NSDictionary *)obj objectForKey:@"weatherinfo"];
            NSLog(@"weatherinfo:%@",weatherinfo);
        }
        
    }];
    
    // 执行任务
    [sessionDataTask resume];
    */
     
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    // 判断对象数据类型
    if([jsonObj isKindOfClass:[NSDictionary class]]){
        // 字典类型
        NSDictionary *dic1 = (NSDictionary *)jsonObj;
        NSDictionary *dic = [dic1 objectForKey:@"weatherinfo"];
        
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"city"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"temp1"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"temp2"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"weather"]];

    }
    if([jsonObj isKindOfClass:[NSArray class]]){
        // 数组类型
        NSArray *arr = (NSArray *)jsonObj;
        
        for (NSDictionary *dic in arr){
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"name"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        }
    }

}

/*
 iOS5+自带JSON操作库
 
 数据解析：
    要求：分别解析以下JSON数据
        {"name":"James","age":"30"}
        {"user":{"name":"James","age":"30"}}
        [{"name":"James"},{"name":"jim"}]
        {"user":[{"name":"James"},{"name":"jim"}]}
    目的：掌握通过NSJSONSerialization类解析JSON数据
    重点：掌握静态函数JSONObjectWithData：options：error：的使用
 */
// 解析JSON数据从字符串
- (void)jsonOnStr{
    _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
    
    //NSString *jsonStr = @"{\"name\":\"James\",\"age\":\"30\"}";
    //NSString *jsonTreeStr = @"{\"user\":{\"name\":\"James\",\"age\":\"30\"}}";
    //NSString *jsonArrStr = @"[{\"name\":\"James\"},{\"name\":\"jim\"}]";
    NSString *jsonTreeArrStr = @"{\"user\":[{\"name\":\"James\"},{\"name\":\"jim\"}]}";
    
    NSData *jsonData = [jsonTreeArrStr dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    // 判断对象数据类型
    if([jsonObj isKindOfClass:[NSDictionary class]]){
        // 字典类型
        NSDictionary *dic1 = (NSDictionary *)jsonObj;
        
        NSArray *arr = [dic1 objectForKey:@"user"];
        
        for (NSDictionary *dic in arr){
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"name"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        }
        
        //        NSDictionary *dic = [dic1 objectForKey:@"user"];
        //        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"name"]];
        //        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        //        _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"age"]];
    }
    if([jsonObj isKindOfClass:[NSArray class]]){
        // 数组类型
        NSArray *arr = (NSArray *)jsonObj;
        
        for (NSDictionary *dic in arr){
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: [dic objectForKey: @"name"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString: @"\n"];
        }
    }
}

@end
