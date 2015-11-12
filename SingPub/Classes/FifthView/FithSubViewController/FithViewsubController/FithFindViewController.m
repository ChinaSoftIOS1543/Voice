//
//  FithFindViewController.m
//  SingPub
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithFindViewController.h"

@interface FithFindViewController ()

@end

@implementation FithFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    self.navigationItem.title = @"找好友";
    self.navigationItem.rightBarButtonItem.title = @"邀请好友";
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:215/255.0f green:161/255.0f blue:57/255.0f alpha:1.0f];
    
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
