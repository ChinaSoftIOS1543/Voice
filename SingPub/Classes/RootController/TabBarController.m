//
//  TabBarController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "MineViewController.h"
#import "ShowViewController.h"
#import "SingingViewController.h"
#import "ChatViewController.h"
#import "FindViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpAllChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

//添加所有控制器的方法
-(void)setUpAllChildViewController
{
    
    MineViewController * mine = [[MineViewController alloc] init];
    
    [self setUpOneChildViewController:mine Title1:@"我的唱吧" ImageName:@"wodechangba_unselect.png" SelectImageName:@"wodechangba_select.png"];
    
    ShowViewController * show = [[ShowViewController alloc] init];
    
    [self setUpOneChildViewController:show Title1:@"精彩表演" ImageName:@"jingcaibiaoyan_unselect.png" SelectImageName:@"jingcaibiaoyan_select.png"];
    
    SingingViewController * sing = [[SingingViewController alloc] init];
    
    [self setUpOneChildViewController:sing Title1:@"唱歌" ImageName:@"changge_unselect.png" SelectImageName:@"changge_select.png"];
    
    ChatViewController * chat = [[ChatViewController alloc] init];
    
    [self setUpOneChildViewController:chat Title1:@"聊天" ImageName:@"xiaoxi_unselect.png" SelectImageName:@"xiaoxi_select.png"];
    
    FindViewController * find = [[FindViewController alloc] init];
    
    [self setUpOneChildViewController:find Title1:@"发现" ImageName:@"faxian_unselect.png" SelectImageName:@"faxian_select.png"];
    
    
}

//抽出添加控制器的方法
-(void)setUpOneChildViewController:(UIViewController *)viewController Title1:(NSString *)title1 ImageName:(NSString *)imageName SelectImageName:(NSString *)selectImageName
{
    NavigationController * nav = [[NavigationController alloc] initWithRootViewController:viewController];
    
    nav.title = title1;
    
    nav.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    UIColor *co = [UIColor colorWithRed:242.0/255.0f green:204.0/255.0f blue:3.0/255.0f alpha:1];
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:215/255.0f green:161/255.0f blue:57/255.0f alpha:1.0f],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [self addChildViewController:nav];
}

@end
