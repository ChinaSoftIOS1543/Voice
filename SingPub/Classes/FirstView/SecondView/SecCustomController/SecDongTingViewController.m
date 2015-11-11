//
//  SecDongTingViewController.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecDongTingViewController.h"
#import "DongTingCusotomCell.h"

@interface SecDongTingViewController ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation SecDongTingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"动听单曲";
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initUI];
}
-(void)initUI
{
    UITableView * table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    table.backgroundColor=[UIColor orangeColor];
    table.delegate=self;
    table.dataSource=self;
    table.estimatedRowHeight=20.0f;
    table.rowHeight=UITableViewAutomaticDimension;
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self.view addSubview:table];
}

#pragma make - TableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cellName";
    DongTingCusotomCell * cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[DongTingCusotomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 60;
//}
//-(nullable UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if (section==0) {
//        
//    }
//    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
//    view.backgroundColor=[UIColor blackColor];
//    
//    return view;
//}
@end
