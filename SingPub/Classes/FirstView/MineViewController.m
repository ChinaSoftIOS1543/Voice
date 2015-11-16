//
//  MineViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "MineViewController.h"
#import "HeaderViewData.h"
#import "HeaderView.h"
#import "LoginViewController.h"
#import "SelfInfoViewController.h"
#import "HomePageCell.h"
#import "HomePageCellData.h"

#define VIEW_TAG 2000

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIView *topView;
    UIView *downView;
    NSMutableArray *tableData;//tableview数据存放数组
    
}
@property(nonatomic,retain)UITableView *tableView;
@end

@implementation MineViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:Nil];
    if (self) {
        tableData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // self.navigationController.navigationBar.hidden = YES;
    [self initUI];
   [self initTaleView];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initUI{
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 84)];
    [self.view addSubview:topView];
    
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClicked:)];
    singleTap.numberOfTapsRequired=1;
    
    HeaderView *headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 84)];
    HeaderViewData *userData = [[HeaderViewData alloc] init];
    userData.userName = @"天天你打野";
    userData.userID = @"唱吧号:hewenjuan";
    headerView.data = userData;
    headerView.userInteractionEnabled = YES;
    headerView.tag = VIEW_TAG;
    [headerView addGestureRecognizer:singleTap];
    [headerView updataHeaderViewInfo];
    
    [topView addSubview:headerView];
}

-(void)imageClicked:(id)sender{

#if 0
    LoginViewController *loginView = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginView animated:YES];
    
#else
    SelfInfoViewController *selfView = [[SelfInfoViewController alloc] init];
    [self.navigationController pushViewController:selfView animated:YES];
#endif
}

-(void)initTaleView{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-84)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //代理类
    _tableView.delegate = self;
    //数据源
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

//几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return [tableData count];
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HomePageCell alloc] initReuseIdentifier:cellIdentifier];
        HomePageCellData *userData = [[HomePageCellData alloc] init];
        userData.userHeaderName = @"change_sound_vivo_1.png";
        userData.userName = @"超级死鬼V587";
        userData.songName = @"天使醉落";
        userData.audienceNumber = [NSNumber numberWithInt:17];
        userData.presentNumber = [NSNumber numberWithInt:18];
        userData.reprintNumber = [NSNumber numberWithInt:19];
        userData.commentNumber = [NSNumber numberWithInt:10];
        userData.userRecommend = @"你是我的玫瑰你是我的花，你是我的爱人是我的牵挂，一朵花儿开就有一朵花儿败，漫山的鲜花只有你是我的真爱";
        cell.data = userData;
        [cell updataHomePageCellInfo];
        
    }
    
    return cell;
    
}

#pragma mark-UITabelViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180.0f;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
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
