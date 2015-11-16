//
//  SelfInfoViewController.m
//  SingPub
//
//  Created by 中软mini017 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SelfInfoViewController.h"
#import "HeaderView.h"
#import "HeaderViewData.h"
#import "MineTableViewCell.h"
#import "MineCellData.h"

//controller
#import "WhoSeenMeViewController.h"         //谁看过我
#import "PersonInfoViewController.h"        //个人信息
#import "MinePhotoAlbumViewController.h"    //我的相册
#import "MineGoldViewController.h"          //我的金币
#import "MineCollectViewController.h"       //我的收藏
#import "MineBackpackViewController.h"      //我的背包
#import "MineGroupViewController.h"         //我的群组
#import "AttentionFanViewController.h"      //我关注的歌友
#import "MineFansViewController.h"          //我的粉丝
#import "LaunchChorusViewController.h"      //我发起的合唱
#import "AttentionChorusViewController.h"   //我关注的合唱
#import "InviteChorusViewController.h"      //邀请我的合唱


#define VIEW_TAG 2000
#define CELL_Tag 2100

@interface SelfInfoViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIView *topView;
    UIView *downView;
    UITableView *tableView;
}

@end

@implementation SelfInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}

-(void)initHeadView{
    
   // [self.view addSubview:topView];
}

-(void)initTableView{
    
    downView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-20, SCREEN_HEIGHT-CGRectGetMaxY(topView.frame)) ];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetMaxY(topView.frame)) style:UITableViewStyleGrouped];
    
    //有无分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.dataSource = self;
    tableView.delegate = self;
//    //裁剪视图
//    tableView.clipsToBounds = NO;
    //自动调整高度
//    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    tableView.showsHorizontalScrollIndicator = NO;
//    tableView.showsVerticalScrollIndicator = NO;
    
    [downView addSubview:tableView];
    [self.view addSubview:downView];
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 84)];
    HeaderView *headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 84)];
    HeaderViewData *userData = [[HeaderViewData alloc] init];
    userData.userName = @"天天你打野";
    userData.userID = @"唱吧号:hewenjuan";
    headerView.data = userData;
    headerView.userInteractionEnabled = YES;
    headerView.tag = VIEW_TAG;
    //[headerView addGestureRecognizer:singleTap];
    [headerView updataHeaderViewInfo];
    [topView addSubview:headerView];
    tableView.tableHeaderView = topView;
    
    
}

#pragma mark - UITableViewDataSource
//1.告诉UITableView要显示几组
//这个方法可以不实现，不实现默认就是分1组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row>1) {
        
    }
    return 50.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}
//2.告诉UITableView每组有几条（几行）数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else
        if (section == 1) {
            return 5;
        }
        else
            if (section == 2) {
                return 3;
            }
            else
                if (section == 3) {
                    return 3;
                }
                else return 0;
}

//3.告诉UITableView每一组的每一行显示什么单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //static NSString *cellIdentifier = @"cellName";
     MineTableViewCell * cell = [[MineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    MineCellData *mineData = [[MineCellData alloc] init];
    if (indexPath.section == 0) {   //第一组
        if (indexPath.row == 0) {
            mineData.leftLabel = @"会员中心";
            mineData.leftImage = @"vip.png";
            cell.data = mineData;
            [cell updataMiewCellInfo];

        }else if(indexPath.row == 1)
        {
            mineData.leftLabel = @"谁看过我";
            mineData.leftImage = @"sheikanguowo.png";
            cell.data = mineData;
            [cell updataMiewCellInfo];
        }
        
    }else if (indexPath.section == 1){  //第二组
        if (indexPath.row == 0) {
            mineData.leftLabel = @"个人信息";;
            mineData.leftImage = @"gerenxinxi.png";
            cell.data = mineData;
            [cell updataMiewCellInfo];
        }else
            if (indexPath.row == 1) {
                mineData.leftLabel = @"我的相册";
                mineData.leftImage = @"rooms_third_mingxing.png";
                cell.data = mineData;
                [cell updataMiewCellInfo];
                
            }
            else
                if (indexPath.row == 2) {
                    mineData.leftLabel = @"我的金币";
                    mineData.leftImage = @"wodejinbi.png";
                    cell.data = mineData;
                    [cell updataMiewCellInfo];
                   
                }
                else
                    if (indexPath.row == 3) {
                        mineData.leftLabel = @"我的收藏";
                        mineData.leftImage = @"wodeshoucang.png";
                        cell.data = mineData;
                        [cell updataMiewCellInfo];
                    }
                    else{
                        mineData.leftLabel = @"我的背包";
                        mineData.leftImage = @"wodebeibao.png";
                        cell.data = mineData;
                        [cell updataMiewCellInfo];
                    }
    }
    else if(indexPath.section == 2){                              //第三组
        if (indexPath.row == 0) {
            mineData.leftLabel = @"我的群组";
            mineData.leftImage = @"wodequnzu.png";
            cell.data = mineData;
            [cell updataMiewCellInfo];
        }
        else
            if (indexPath.row == 1) {
                mineData.leftLabel = @"我关注的歌友";
                mineData.leftImage = @"woguanzhudegeyou.png";
                cell.data = mineData;
                [cell updataMiewCellInfo];
            }
            else{
                mineData.leftLabel = @"我的粉丝";
                mineData.leftImage = @"wodefensi.png";
                cell.data = mineData;
                [cell updataMiewCellInfo];
                }
    }
    else if(indexPath.section == 3 ){
        if (indexPath.row == 0) {
            mineData.leftLabel = @"我发起的合唱";
            mineData.leftImage = @"wofaqidehechang.png";
            cell.data = mineData;
            [cell updataMiewCellInfo];
            
        }
        else if(indexPath.row == 1){
            mineData.leftLabel = @"我关注的合唱";
            mineData.leftImage = @"woguanzhudehechang.png";
            cell.data = mineData;
            [cell updataMiewCellInfo];
            
        }
        else if(indexPath.row == 2){
            mineData.leftLabel = @"邀请我的合唱";
            mineData.leftImage = @"yaoqingwodehechang.png";
            cell.data = mineData;
            [cell updataMiewCellInfo];
            
        }
    }else
        cell.textLabel.text = @"直播回顾";
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *controller;
    
    switch (indexPath.section ) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    
                    break;
                case 1:
                {
                    WhoSeenMeViewController *whoSeenMe = [[WhoSeenMeViewController alloc] init];
                    controller = whoSeenMe;
                }
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:{
                    PersonInfoViewController *personInfo = [[PersonInfoViewController alloc] init];
                    controller = personInfo;
                }
                    
                    break;
                case 1:{
                    MinePhotoAlbumViewController *minePhoto = [[MinePhotoAlbumViewController alloc] init];
                    controller = minePhoto;
                }
                    
                    break;
                case 2:{
                    MineGoldViewController *mineGold = [[MineGoldViewController alloc] init];
                    controller = mineGold;
                }
                    
                    break;
                case 3:{
                    MineCollectViewController *mineCollect = [[MineCollectViewController alloc] init];
                    controller = mineCollect;
                }
                    
                    break;
                case 4:{
                    MineBackpackViewController *mineBackpack = [[MineBackpackViewController alloc] init];
                    controller = mineBackpack;
                }
                    
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:{
                    PersonInfoViewController *personInfo = [[PersonInfoViewController alloc] init];
                    controller = personInfo;
                }
                    
                    break;
                case 1:{
                    PersonInfoViewController *personInfo = [[PersonInfoViewController alloc] init];
                    controller = personInfo;
                }
                    
                    break;
                case 2:{
                    PersonInfoViewController *personInfo = [[PersonInfoViewController alloc] init];
                    controller = personInfo;
                }
                    
                    break;
                    
                default:
                    break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:{
                    PersonInfoViewController *personInfo = [[PersonInfoViewController alloc] init];
                    controller = personInfo;
                }
                    
                    break;
                case 1:{
                    PersonInfoViewController *personInfo = [[PersonInfoViewController alloc] init];
                    controller = personInfo;
                }
                    
                    break;
                case 2:{
                    PersonInfoViewController *personInfo = [[PersonInfoViewController alloc] init];
                    controller = personInfo;
                }
                    
                    break;
                    
                default:
                    break;
            }
            break;
       
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
    NSLog(@"%ld  %ld",(long)indexPath.row,(long)indexPath.section);
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
