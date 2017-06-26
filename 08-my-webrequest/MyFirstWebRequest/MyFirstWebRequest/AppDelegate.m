//
//  AppDelegate.m
//  MyFirstWebRequest
//
//  Created by zc on 2017/5/23.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // NSURLConnection 类已经过时，使用替代类 NSURLSession
    
    // 表示访问的服务器
    NSURL *url = [NSURL URLWithString:@"http://www.imooc.com"];
    
    // 表示客户端发起的网络请求的请求内容
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"GET";
    
    // 获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 根据会话对象，创建一个Task任务
    NSURLSessionTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data,NSURLResponse * _Nullable response, NSError * _Nullable error){
        
        // 解析响应数据
        NSLog(@"从服务器获取到数据,响应消息：%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);

    }];
    
    // 执行任务
    [sessionDataTask resume];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
