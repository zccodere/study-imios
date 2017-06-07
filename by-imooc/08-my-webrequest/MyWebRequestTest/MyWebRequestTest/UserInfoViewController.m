//
//  UserInfoViewController.m
//  MyWebRequestTest
//
//  Created by zc on 2017/5/23.
//  Copyright © 2017年 com.zccoder. All rights reserved.
//

#import "UserInfoViewController.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width // 定义宏 屏幕宽度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height // 定义宏 屏幕宽度

@interface UserInfoViewController ()

@property (nonatomic,strong)UILabel *phoneLable;
@property (nonatomic,strong)UITextField *phoneTextFiled;

@end

//第一步：布局页面
//第二步：发起网络请求获取个人用户信息
//第三步：解析网络响应数据，将其展示到页面上


@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置父View背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 创建标题控件
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, 20)];
    [titleLabel setText:@"个人用户信息"];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleLabel];
    
    // 创建用户名控件
    _userNameView = [[KeyValueView alloc] initWithFrame:CGRectMake(100, 70, kScreenWidth - 100 *2 , 30)];
    _userNameView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_userNameView];
    
    // 创建用户性别控件
    _userSexView = [[KeyValueView alloc] initWithFrame:CGRectMake(100, 70 + 30, kScreenWidth - 100 *2 , 30)];
    _userSexView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_userSexView];
    
    // 创建用户生日控件
    _userBirthdayView = [[KeyValueView alloc] initWithFrame:CGRectMake(100, 70 + 30 * 2, kScreenWidth - 100 *2 , 30)];
    _userBirthdayView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_userBirthdayView];
    
    // 创建用户邮箱控件
    _userEmailView = [[KeyValueView alloc] initWithFrame:CGRectMake(100, 70 + 30 * 3, kScreenWidth - 100 *2 , 30)];
    _userEmailView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_userEmailView];
    
    // 创建用户手机控件
//    _userPhoneView = [[KeyValueView alloc] initWithFrame:CGRectMake(100, 70 + 30 * 4, kScreenWidth - 100 *2 , 30)];
//    _userPhoneView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:_userPhoneView];
    
    _phoneLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 70 + 30 * 4, (kScreenWidth -100*2)/3, 30)];
    _phoneLable.backgroundColor = [UIColor clearColor];
    _phoneLable.textAlignment = NSTextAlignmentLeft;
    _phoneLable.font = [UIFont systemFontOfSize:16];
    _phoneLable.textColor = [UIColor blackColor];
    [self.view addSubview:_phoneLable];
    
    // 创建可编辑用户手机号控件
    _phoneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(100+(kScreenWidth -100*2)/3, 70 + 30 * 4, kScreenWidth - 100 *2, 30)];
    _phoneTextFiled.backgroundColor = [UIColor clearColor];
    _phoneTextFiled.textAlignment = NSTextAlignmentLeft;
    _phoneTextFiled.font = [UIFont systemFontOfSize:16];
    _phoneTextFiled.textColor = [UIColor blackColor];
    // 设置键盘格式 数字键盘
    _phoneTextFiled.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_phoneTextFiled];
    
    // 请求按钮控件
    UIButton *getUserInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 70 + 30 * 5, kScreenWidth - 100*2, 30)];
    getUserInfoButton.backgroundColor = [UIColor redColor];
    [getUserInfoButton setTitle:@"获取信息" forState:UIControlStateNormal];
    [getUserInfoButton setTintColor:[UIColor whiteColor]];
    // 添加事件
    [getUserInfoButton addTarget:self action:@selector(loadGetWebRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getUserInfoButton];
    
    // 保存按钮控件
    UIButton *saveUserInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 70 + 30 * 7, kScreenWidth - 100*2, 30)];
    saveUserInfoButton.backgroundColor = [UIColor redColor];
    [saveUserInfoButton setTitle:@"保存信息" forState:UIControlStateNormal];
    [saveUserInfoButton setTintColor:[UIColor whiteColor]];
    // 添加事件
    [saveUserInfoButton addTarget:self action:@selector(loadPostWebRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveUserInfoButton];
    
    
}

// 发起GET请求并解析响应数据
-(void)loadGetWebRequest:(id)sender{
    // 指明访问的服务器地址
    NSURL *url = [NSURL URLWithString:@"http://115.159.205.199:12580/WebServer/user/1"];
    // 创建请求对象 NSURLRequest默认请求方式为GET
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 设置请求方式
    [request setHTTPMethod:@"GET"];
    
    // 获得会话对象
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
            NSDictionary *userInfo = [(NSDictionary *)obj objectForKey:@"userInfo"];
            
            NSString *userName = [userInfo objectForKey:@"userName"];
            [_userNameView setupKey:@"姓名" value:userName];
            NSLog(@"userName = %@",userName);
            
            NSString *userSex = [NSString stringWithFormat:@"%@",[userInfo objectForKey:@"userSex"]];
            if([userSex isEqualToString: @"1"]){
                userSex = @"女";
            }
            if([userSex isEqualToString: @"0"]){
                userSex = @"男";
            }
            [_userSexView setupKey:@"性别" value:userSex];
            NSLog(@"userSex = %@",userSex);
            
            NSString *userBirthday = [userInfo objectForKey:@"userBirthday"];
            [_userBirthdayView setupKey:@"生日" value:userBirthday];
            NSLog(@"userBirthday = %@",userBirthday);
            
            
            NSString *userEmail = [userInfo objectForKey:@"userEmail"];
            [_userEmailView setupKey:@"邮箱" value:userEmail];
            NSLog(@"userEmail = %@",userEmail);
            
            NSString *userPhone = [userInfo objectForKey:@"userPhone"];
//            [_userPhoneView setupKey:@"手机" value:userPhone];
            [_phoneLable setText:@"手机"];
            [_phoneTextFiled setText:userPhone];
            NSLog(@"userPhone = %@",userPhone);
            
            
        }
        
    }];
    
    // 执行任务
    [sessionDataTask resume];
}

// 发起POST请求并解析响应数据
-(void)loadPostWebRequest:(id)sender{
    
    // 不需要将网络请求参数拼接到url后面
    NSURL *url = [NSURL URLWithString:@"http://115.159.205.199:12580/WebServer/user/1"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    // 编辑后的手机号
    NSString *newPhone = [_phoneTextFiled text];
    
    // 封装请求参数
    NSString *postParam = [NSString stringWithFormat:@"phone=%@",newPhone];
    NSData *postData = [postParam dataUsingEncoding:NSUTF8StringEncoding];
    // POST请求参数使用如下方法进行赋值
    [request setHTTPBody:postData];
    
    // 获得会话对象
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
            NSDictionary *bstatus = [(NSDictionary *)obj objectForKey:@"bstatus"];
            
            NSString *desc = [bstatus objectForKey:@"desc"];
            [_userNameView setupKey:@"描述" value:desc];
            NSLog(@"desc = %@",desc);
            
        }
    }];
    
    // 执行任务
    [sessionDataTask resume];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
