//
//  NavigationController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
}

-(void)initNavigationBar:(UIViewController *)viewController
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:243/255.0f green:243/255.0f blue:243/255.0f alpha:1.0f]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    
    
    if (self.viewControllers.count >0 )
    {
        //在压栈的时候判断如果是二级界面，就把Tabbar隐藏
        viewController.hidesBottomBarWhenPushed = YES;
        
        //navigation左Btn,后期可根据情况修改
        UIImage *image1 = [[UIImage imageNamed:@"arrow.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStylePlain target:self action:@selector(backBtn:)];
        
        viewController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
        
        //navigationu右Btn,后期可根据情况修改
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone target:self action:@selector(topBtn:)];
        
    }
    
}

-(void)backBtn:(id)sender
{
    [self popToRootViewControllerAnimated:YES];
}

-(void)topBtn:(id)sender
{
    [self popToRootViewControllerAnimated:YES];
}

//压栈方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //压栈之前调用方法
    [self initNavigationBar:viewController];
    
    //后压栈
    [super pushViewController:viewController animated:YES];
}

@end
