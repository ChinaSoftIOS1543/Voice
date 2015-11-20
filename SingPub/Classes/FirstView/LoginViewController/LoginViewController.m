//
//  LoginViewController.m
//  SingPub
//
//  Created by 中软mini017 on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import <Foundation/Foundation.h>



//#define Screen_height SCREEN_HEIGHT
#define Screen_width (SCREEN_WIDTH-20)

//橘红色
#define ReddishOrange_Color [UIColor colorWithRed:1.0 green:0.3 blue:0.0 alpha:1]
//半透明灰色
#define HalfGary_Color [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]
//半透明灰色
#define HalfGary_TitleColor [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0]
//半透明蓝色
#define HalfBlue_Color [UIColor colorWithRed:0.0 green:0.2 blue:0.9 alpha:0.8]

#define LOGIN_HEIGHT  (SCREEN_HEIGHT/2-44-self.navigationController.navigationBar.frame.size.height)/25

#define TextField_Tag  2100
#define Imge_Tage 2200

@interface LoginViewController ()<UITextFieldDelegate >{
    
    UIView *keyWindView;
    
    UIView *topView;
    UIView *downView;
    UIView *footView;
    
    UITextField *userNameField;
    UITextField *passwordField;
    UIButton *loginBtn;
    UILabel *label;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"登录";
    // Do any additional setup after loading the view.
    keyWindView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, Screen_width, SCREEN_HEIGHT)];
    keyWindView.backgroundColor = HalfGary_Color;
    self.view.backgroundColor = [UIColor clearColor];
    
    [self initTopUI];
    [self initDownUI];
    [self initFootViewUI];
    [self.view addSubview:keyWindView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(Screen_width/3-12.5, CGRectGetMaxY(downView.frame)-10, Screen_width/3+25, 20)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, Screen_width/3+20, 20)];
    label1.text = @"使用QQ,微博账号登录";
    label1.textColor = HalfGary_TitleColor;
    label1.font = [UIFont systemFontOfSize:12];
    [view addSubview:label1];
    [keyWindView addSubview:view];
    
}

-(void)initTopUI{
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20+self.navigationController.navigationBar.frame.size.height, Screen_width, LOGIN_HEIGHT*25)];
    topView.backgroundColor = [UIColor whiteColor];
    [keyWindView addSubview:topView];
    
    userNameField = [[UITextField alloc] initWithFrame:CGRectMake(0,LOGIN_HEIGHT*2, Screen_width, LOGIN_HEIGHT*5)];
    userNameField.returnKeyType = UIReturnKeyNext;
    userNameField.tag = TextField_Tag;
    userNameField.delegate = self;
    [self initTextfield:userNameField andTextPlaceholder:@"请输入你的账号" andImageName:@"denglu_unselect.png"];
    [topView addSubview:userNameField];
    
    //设置密码textfield
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(userNameField.frame)+LOGIN_HEIGHT*2, Screen_width, LOGIN_HEIGHT*5)];
    passwordField.tag = TextField_Tag+1;
    passwordField.returnKeyType = UIReturnKeyDefault;
    passwordField.delegate = self;
    [self initTextfield:passwordField andTextPlaceholder:@"请输入你的密码" andImageName:@"mima_unselect.png"];
    //输入内容为＊
    passwordField.secureTextEntry = YES;
    [topView addSubview:passwordField];
    
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(passwordField.frame)+LOGIN_HEIGHT*2, Screen_width, LOGIN_HEIGHT*4)];
    loginBtn.backgroundColor = ReddishOrange_Color;
    loginBtn.layer.cornerRadius = 4.0f;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginBtn addTarget:self action:@selector(loginBtnCliked:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:loginBtn];
    
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapClicked:)];
    singleTap.numberOfTapsRequired=1;
    
    label= [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(loginBtn.frame), Screen_width, LOGIN_HEIGHT*5-0.5)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"忘记了密码或账号？";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:14];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:singleTap];
    [topView addSubview:label];
}

-(void)initTextfield:(id)sender  andTextPlaceholder:(NSString *)placeholder andImageName:(NSString *)imageName{
    if (sender && [sender isKindOfClass:[UITextField class]]) {
        UITextField *textField = (UITextField *)sender;
        textField.backgroundColor = [UIColor clearColor];
        //水印内容
        textField.placeholder = placeholder;
        textField.textColor = [UIColor blackColor];
        //设置边框
        textField.layer.cornerRadius = 5.0f;
        textField.layer.masksToBounds = YES;
        textField.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        textField.layer.borderWidth = 1.0f;
        
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //给用户名label添加左边图片
        UIImageView *userNameImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 20, 20)];
        userNameImage.image = [UIImage imageNamed:imageName];
        textField.leftView = userNameImage;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    
}
//开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //选中时改变图片
    switch (textField.tag) {
        case TextField_Tag:
            [self initTextfield:userNameField andTextPlaceholder:@"请输入你的账号" andImageName:@"denglu_select.png"];
            break;
        case TextField_Tag+1:
            [self initTextfield:passwordField andTextPlaceholder:@"请输入你的账号" andImageName:@"mima_select.png"];
            break;
        default:
            break;
    }
}
//完成编辑
- (void)textFieldDidEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        case TextField_Tag:
            [self initTextfield:userNameField andTextPlaceholder:@"请输入你的账号" andImageName:@"denglu_unselect.png"];
            break;
        case TextField_Tag+1:
            [self initTextfield:passwordField andTextPlaceholder:@"请输入你的账号" andImageName:@"mima_unselect.png"];
            break;
        default:
            break;
    }
}

-(void)loginBtnCliked:(id)sender{
    NSLog(@"user=%@",userNameField.text);
    NSLog(@"password=%@",passwordField.text);
    
    NSString * Str=@"http://jiayahan0223.sinaapp.com/regis.php";
    NSString * body=[NSString stringWithFormat:@"newuser=%@&newpass=%@",userNameField.text,passwordField.text];
    NSURL * url =[NSURL URLWithString:[Str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData * data1 =[body dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest * req=[[NSMutableURLRequest alloc] initWithURL:url];
    
    [req setHTTPBody:data1];
    [req setHTTPMethod:@"POST"];
    [req setURL:url];
    [req setTimeoutInterval:10];
    [req setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    
    NSOperationQueue * queue=[[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:req queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError==nil) {
            NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
            NSLog(@"%@",response);
            NSLog(@"%@",dic);
        }else
        {
            NSLog(@"error");
        }

    }];
    
}

#pragma mark-btnClicked

//忘记密码操作
-(void)TapClicked:(id)sender{
    NSLog(@"wangji");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
//手机注册
-(void)registerClicked:(id)sender{
    
    RegisterViewController *regView = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:regView animated:YES ];
    
}

-(void)imageClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer *Tap = (UITapGestureRecognizer *)sender;
        switch (Tap.view.tag) {
            case Imge_Tage:
                NSLog(@"qqdenglu");
                break;
            case Imge_Tage+1:
                NSLog(@"xinglangdenglu");
                break;
            default:
                break;
        }
    }
    
}

#pragma mark-initDownView
//设置中加view
-(void)initDownUI{
    
    downView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)+0.5, Screen_width, (SCREEN_HEIGHT-CGRectGetMaxY(topView.frame)+0.5)/2-30-0.5)];//30改成25不好使不知道为啥？
    downView.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, LOGIN_HEIGHT*2, Screen_width, LOGIN_HEIGHT*4)];
    btn.backgroundColor = HalfBlue_Color;
    btn.layer.cornerRadius = 4.0f;
    [btn setTitle:@"用手机号注册" forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(registerClicked:) forControlEvents:UIControlEventTouchUpInside];
    [downView addSubview:btn];
    [keyWindView addSubview:downView];
}

-(void)initFootViewUI{
    
    footView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(downView.frame)+0.5, Screen_width, SCREEN_HEIGHT-CGRectGetMaxY(downView.frame)+0.5)];
    [keyWindView addSubview:footView];
    //创建手势
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClicked:)];
    singleTap.numberOfTapsRequired=1;
    UITapGestureRecognizer *singleTap1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClicked:)];
    singleTap1.numberOfTapsRequired=1;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, LOGIN_HEIGHT*3, Screen_width/2, LOGIN_HEIGHT*9)];
    leftView.tag = Imge_Tage;
    //添加手势
    [leftView addGestureRecognizer:singleTap];
    leftView.userInteractionEnabled = YES;
    
    footView.backgroundColor = [UIColor whiteColor];
    UIImageView *QQLoginView = [[UIImageView alloc] initWithFrame:CGRectMake((Screen_width/2)/2/2, 0, (Screen_width/2/3), (Screen_width/2/3))];
    QQLoginView.image = [UIImage imageNamed:@"login_qq_icon_normal.png"];
    
    UILabel *QQLoginLabel = [[UILabel alloc] initWithFrame:CGRectMake((Screen_width/2)/2/2, CGRectGetMaxY(QQLoginView.frame), (Screen_width/2/3), LOGIN_HEIGHT*4)];
    QQLoginLabel.text = @"腾讯QQ";
    QQLoginLabel.font = [UIFont systemFontOfSize:12];
    QQLoginLabel.textAlignment = NSTextAlignmentCenter;
    [leftView addSubview:QQLoginLabel];
    [leftView addSubview:QQLoginView];
    [footView addSubview:leftView];
    
    //创建右边新浪微博登录view
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(Screen_width/2, LOGIN_HEIGHT*3, Screen_width/2, LOGIN_HEIGHT*9)];
    rightView.tag = Imge_Tage+1;
    [rightView addGestureRecognizer:singleTap1];
    rightView.userInteractionEnabled = YES;
    
    UIImageView *MicroblogLoginView = [[UIImageView alloc] initWithFrame:CGRectMake((Screen_width/2)/2/2, 0, (Screen_width/2/3), (Screen_width/2/3))];
    MicroblogLoginView.image = [UIImage imageNamed:@"login_sina_icon_normal.png"];
    
    UILabel *MicroblogLoginLabel = [[UILabel alloc] initWithFrame:CGRectMake((Screen_width/2)/2/2, CGRectGetMaxY(QQLoginView.frame), (Screen_width/2/3), LOGIN_HEIGHT*4)];
    MicroblogLoginLabel.text = @"新浪微博";
    MicroblogLoginLabel.font = [UIFont systemFontOfSize:12];
    MicroblogLoginLabel.textAlignment = NSTextAlignmentCenter;
    [rightView addSubview:MicroblogLoginView];
    [rightView addSubview:MicroblogLoginLabel];
    [footView addSubview:rightView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
