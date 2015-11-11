//
//  SecCaiViewController.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecCaiViewController.h"
#import "SecCustomCell.h"
#import "CustomPeopleImage.h"

@interface SecCaiViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView * _sectionView;
    UIView * _sectionOtherView;
}

@end

@implementation SecCaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"猜你喜欢";
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden=NO;
//}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initUI];
    [self sectionOtherView];
    [self initSectionView];
    
}
-(void)initUI
{
    UITableView * tableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.rowHeight=101;
    tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLineEtched;
    tableView.backgroundColor=[UIColor blueColor];
    //table 自动上移
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self.view addSubview:tableView];
    
}

-(void)initSectionView
{
    _sectionView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    _sectionView.backgroundColor=[UIColor blueColor];
    UIImageView* imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    imageView.image=[UIImage imageNamed:@"Default-568h.png"];
    [_sectionView addSubview:imageView];
    
    UILabel * userName=[[UILabel alloc] initWithFrame:CGRectMake(0, 110, 200, 20)];
    userName.textAlignment=NSTextAlignmentLeft;
    userName.backgroundColor=[UIColor blackColor];
    [_sectionView addSubview:userName];
    
    UILabel * workName=[[UILabel alloc] initWithFrame:CGRectMake(0, 140, 200, 20)];
    workName.textAlignment=NSTextAlignmentLeft;
    workName.backgroundColor=[UIColor blackColor];
    [_sectionView addSubview:workName];
}

-(void)sectionOtherView
{
    _sectionOtherView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 480)];
    _sectionOtherView.backgroundColor=[UIColor orangeColor];
    for (int i=0; i<4;i++) {
        for (int j=0; j<2; j++) {
            CustomPeopleImage * imageView=[[CustomPeopleImage alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2*j, 120*i, SCREEN_WIDTH/2, 120)];
            imageView.delegate=self;
            [_sectionOtherView addSubview:imageView];
        }
    }
}
#pragma make - TableDelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return _sectionView;
        
    }else{
        return _sectionOtherView;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cellName";
    SecCustomCell * cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[SecCustomCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }else
    {
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 160;
    }else
    {
        return 480;
    }
}
@end
