//
//  RecordingViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "RecordingViewController.h"

@interface RecordingViewController ()

@end

@implementation RecordingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"哼出你想唱的歌曲";

    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    
    [self navigationBarBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)navigationBarBtn
{
    UIImage * leftImage = [[UIImage imageNamed:@"arrow@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage  style:UIBarButtonItemStylePlain target:self action:@selector(backBtn:)];
}

-(void)backBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
