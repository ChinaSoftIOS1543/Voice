//
//  ShowViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "ShowViewController.h"
#import "SecCustomImageView.h"
#import "CustomPeopleImage.h"
#import "SecCustomCell.h"
#import "SecCustomImageData.h"
#import "SecBangController.h"
#import "SecCaiViewController.h"
#import "SecDongTingViewController.h"
#import "ZongBangController.h"
#import "SecGeDanController.h"

@interface ShowViewController ()<UITableViewDataSource,UITableViewDelegate,SecCustomImageViewDelegate,CustomPeopleImageDeldgate>
{
    UIView * _headView;
    UIView * _sectionView;
    UIView * _sectionOtherView;
    UIButton * _btn;
}
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeadView];
    [self initSectionView];
    [self sectionOtherView];
    [self initLefaButton];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    _btn.hidden=NO;
    [super viewWillAppear:animated];
    [self initUI];
    self.navigationController.navigationBar.hidden=NO;
}
-(void)initUI
{
    
    UITableView * tableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-108) style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.tableHeaderView=_headView;
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.rowHeight=101;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //table 自动上移
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self.view addSubview:tableView];
}
//8个可点击图标
-(void)initHeadView
{
    _headView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    _headView.backgroundColor=[UIColor clearColor];
    NSInteger count=0;
    for (int i=0; i<=3; i++) {
        for (int j=0; j<=1; j++) {
            SecCustomImageView * imageView=[[SecCustomImageView alloc] init];
            NSArray * arr=[[NSArray alloc] initWithArray:[[SecCustomImageData shareIntances] getMyData]];
            if ((count>=0)&&(count<=7)) {
                imageView.data=[arr objectAtIndex:count++];
            }
            imageView.frame=CGRectMake(SCREEN_WIDTH/4*i, 80*j, SCREEN_WIDTH/5, 80);
            imageView.backgroundColor=[UIColor clearColor];
            imageView.imageTag = 3000+i*10+j;
            imageView.delegate=self;
            
            [imageView updateImage];
            
            
            [_headView addSubview:imageView];
        }
    }
}

//左按钮
-(void)initLefaButton
{
    _btn=[[UIButton alloc] initWithFrame:CGRectMake(10, 10, 40, 30)];
    _btn.backgroundColor=[UIColor blackColor];
    [_btn setTitle:@"火星榜" forState:normal];
    _btn.titleLabel.font=[UIFont systemFontOfSize:12];
    [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_btn];
}
//sectionView 初始化 top1
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
#pragma mark-tableDelegate

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
-(void)btnClick:(id)sender
{
    self.navigationController.navigationBar.hidden=YES;
    SecBangController * bangCtr=[[SecBangController alloc] init];
  
    [self.navigationController pushViewController:bangCtr animated:YES];
}
-(void)ImageViewDelegateClick:(UITapGestureRecognizer*)sender
{
    NSLog(@"%d",sender.view.tag);
    _btn.hidden=YES;
    switch (sender.view.tag) {
        case 3000:
        {
            SecCaiViewController * caiController=[[SecCaiViewController alloc] init];
            [self.navigationController pushViewController:caiController animated:YES];
            
        }
            break;
        case 3010:
        {
            SecDongTingViewController * dongTingController=[[SecDongTingViewController alloc] init];
            [self.navigationController pushViewController:dongTingController animated:YES];
        }
            break;
        case 3020:
        {
            ZongBangController * zongbang=[[ZongBangController alloc] init];
            [self.navigationController pushViewController:zongbang animated:YES];
        }
            break;
        case 3030:
        {
        }
            break;
        case 3001:
        {
            SecGeDanController * gedanController=[[SecGeDanController alloc] init];
            [self.navigationController pushViewController:gedanController animated:YES];
        }
            break;
        case 3011:
        {
        }
            break;
        case 3012:
        {
        }
            break;
        case 3013:
        {
        }
            break;

    }
}
-(void)CustomPeopleClick:(id)sender
{
    NSLog(@"22");
}

@end
