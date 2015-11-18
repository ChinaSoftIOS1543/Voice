//
//  FindViewController.m
//  ChangBaProject
//
//  Created by 中软mini011 on 15/10/30.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
#import "FithSetViewController.h"
#import "FithGameViewController.h"
#import "FithMatchViewController.h"
#import "FithFindViewController.h"
#import "FithVIPViewController.h"
#import "AvPlayerViewController.h"
#import "Engin.h"
#define game_tag 6000
#define hot_tag 6001
#define findfr_tag 6002

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate,ZBarReaderDelegate>
{
    UITableView *_tableView;
    NSDictionary *_itemsLists;
    UIView *view;
    UIView *view1;
    UIView *view2;
    UIView *view3;
    UIView *headView;
    UIImageView *imageview1;
    UILabel *label1;
    UIView *v1;
    FithSetViewController *set;
    FithFindViewController *find;
    FithMatchViewController *match;
    FithGameViewController *game;
}

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    // Do any additional setup after loading the view.
    
    
}
-(void)initUI{
    //修改图片名
    UIImage *image = [[UIImage imageNamed:@"setting.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(leftBtn:)];
    UIImage *image1 = [[UIImage imageNamed:@"yinyue.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image1 style:UIBarButtonItemStyleDone target:self action:@selector(rightBtn:)];
    self.navigationItem.title = @"发现";
    
    [self getTableViewDataSource];
    [self initTabView];
    [self initQR];
}
-(void)rightBtn:(id)sender{
    AvPlayerViewController *avplay = [AvPlayerViewController sharedController];
    avplay.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:avplay animated:YES];
    
}

-(void)leftBtn:(id)sender
{
    set = [[FithSetViewController alloc] init];
    
    set.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:set animated:YES];
}

-(void)getTableViewDataSource{
    _itemsLists = [[Engin sharInstance] getFinddata];
}

-(void)initTabView{
    //初始化
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    //决定子视图的显示范围，yes裁剪，no不裁剪
    _tableView.clipsToBounds = NO;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //自动调整高度，保证与superView顶部和底部的距离不变
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    
    //顶上3个图片
    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90)];
    headView.backgroundColor = [UIColor whiteColor];
    _tableView.tableHeaderView = headView;
    
    view1 = [self ViewWithFrame:CGRectMake(10,10 , (SCREEN_WIDTH-10*4)/3, 70) WithBackCollor:[UIColor colorWithRed:255/255.0f green:100/255.0f blue:100/255.0f alpha:1.0f] Tag:game_tag image:[UIImage imageNamed:@"youxizhongxin.png"] Title:@"游戏中心"];
    view2 = [self ViewWithFrame:CGRectMake((SCREEN_WIDTH-10*4)/3+10+10, 10, (SCREEN_WIDTH-10*4)/3, 70) WithBackCollor:[UIColor colorWithRed:51/255.0f green:183/255.0f blue:201/255.0f alpha:1.0f] Tag:hot_tag image:[UIImage imageNamed:@"remenbisai.png"] Title:@"热门比赛"];
    
    view3 = [self ViewWithFrame:CGRectMake((SCREEN_WIDTH-10*4)*2/3+10+10+10, 10, (SCREEN_WIDTH-10*4)/3, 70) WithBackCollor:[UIColor colorWithRed:137/255.0f green:179/255.0f blue:0/255.0f alpha:1.0f] Tag:findfr_tag image:[UIImage imageNamed:@"zhaopengyou.png"] Title:@"找好友"];
    
    _tableView.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
    [self.view addSubview:_tableView];
    
}
-(UIView*)ViewWithFrame:(CGRect)frame WithBackCollor:(UIColor*)color Tag:(int)tag image:(UIImage *)image Title:(NSString*)title{
        view = [[UIView alloc] init];
        view.frame = frame;
        [view setTag:tag];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FindViewClicked:)];
        [view addGestureRecognizer:tap];
        view.backgroundColor = color;
        view.layer.cornerRadius = 3.0f;
        //测试view位置
        //view.backgroundColor = [UIColor whiteColor];
        view.userInteractionEnabled = YES;
        [headView addSubview:view];
    
        //view上面的icon
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.image = image;
        imageview.frame = CGRectMake(frame.size.width/2-30/2, 5, 30, 30);
    
        //测试位置
        //imageview.backgroundColor = [UIColor blackColor];
        [view addSubview:imageview];
    
        //view上面label
        UILabel *lable = [[UILabel alloc] init];
        lable.text = title;
        lable.frame = CGRectMake(0, CGRectGetMaxY(imageview.frame)+5, frame.size.width, 20);
        lable.font = [UIFont systemFontOfSize:14];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = [UIColor whiteColor];
        [view addSubview:lable];
    
        return view;
    }

-(void)FindViewClicked:(UITapGestureRecognizer *)sender{
        //UIView *vi = (UIView *)sender;
    
    
        if (sender && [sender isKindOfClass:[UITapGestureRecognizer class]])
            {
            
                switch (sender.view.tag) {
                            case game_tag:
                                [self initGame];
                                    break;
                            case hot_tag:
                                [self initMatch];
                                    break;
                            case findfr_tag:
                            [self initFind];
                                    break;
                    
                            default:
                                   break;
                        }
                }
    }
-(void)initGame{
    game = [[FithGameViewController alloc] init];
    game.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:game animated:YES ];
    
}
-(void)initMatch{
    match = [[FithMatchViewController alloc] init];
    match.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:match animated:YES ];
    
}
-(void)initFind{
    find = [[FithFindViewController alloc] init];
    find.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:find animated:YES ];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0f;
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _itemsLists.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ((NSArray *)[_itemsLists objectForKey:[NSString stringWithFormat:@"arr%d",section+1]]).count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellType = @"cellType";
    FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (cell == nil) {
        cell = [[FindTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
    }
    
    NSArray *items = [_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long)indexPath.section+1]];
    
    int x = (int)items.count;
    if (indexPath.row>=0 && indexPath.row < x) {
        NSArray *mineArray = (NSArray *)[_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long)indexPath.section+1]];
        FindData *mine = [mineArray objectAtIndex:indexPath.row];
        cell.data = mine;
    }
    
    [cell updateFindCell];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.section == 0) {
                //唱吧商城界面
            }
    
        if (indexPath.section == 1) {
                if (indexPath.row == 0) {
                        //唱吧直播间   跳转网页
                    }
                if (indexPath.row == 1) {
                        //唱吧麦颂ktv  进入新界面  新tabbar
                    }
                if (indexPath.row == 2) {
                        //扫描二维码  调用相机
                    
                    [self QRshow];
                    }
            }
        if (indexPath.section == 2) {
                if (indexPath.row == 0) {
                        //会员中心界面
                    [self initVIP];
                    }
                if (indexPath.row == 1) {
                        //表情商店界面
                    }
            }
        if (indexPath.section == 3) {
                //沃唱吧包流量服务
            }
    }

-(void)initQR{
    v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    v1.hidden = YES;
    v1.backgroundColor = [UIColor whiteColor];
    [self.view.window addSubview:v1];
    imageview1 = [[UIImageView alloc] init];
    imageview1.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-200);
    [v1 addSubview:imageview1];
    
    label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 50);
    [v1 addSubview:label1];
    
}

-(void)QRshow{
    v1.hidden = NO;
    
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    [self presentModalViewController: reader
                            animated: YES];
    
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    
    
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    imageview1.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    [reader dismissModalViewControllerAnimated: YES];
    
    //判断是否包含 头'http:'
    NSString *regex = @"http+:[^\\s]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    //判断是否包含 头'ssid:'
    NSString *ssid = @"ssid+:[^\\s]*";;
    NSPredicate *ssidPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ssid];
    
    label1.text =  symbol.data ;
    
    //获取label1的内容
    if ([predicate evaluateWithObject:label1.text]) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil
                                                        message:@"It will use the browser to this URL。"
                                                       delegate:nil
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles:@"Ok", nil];
        alert.delegate = self;
        alert.tag=1;
        [alert show];
        
    }
    else if([ssidPre evaluateWithObject:label1.text]){
        
        NSArray *arr = [label1.text componentsSeparatedByString:@";"];
        
        NSArray * arrInfoHead = [[arr objectAtIndex:0] componentsSeparatedByString:@":"];
        
        NSArray * arrInfoFoot = [[arr objectAtIndex:1] componentsSeparatedByString:@":"];
        
        
        label1.text=[NSString stringWithFormat:@"ssid: %@ \n password:%@",
         [arrInfoHead objectAtIndex:1],[arrInfoFoot objectAtIndex:1]];
        
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:label1.text
                                                        message:@"The password is copied to the clipboard , it will be redirected to the network settings interface"
                                                       delegate:nil
                                              cancelButtonTitle:@"Close"
                                              otherButtonTitles:@"Ok", nil];
        
        
        alert.delegate = self;
        alert.tag=2;
        [alert show];
        UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
        //        然后，可以使用如下代码来把一个字符串放置到剪贴板上：
        pasteboard.string = [arrInfoFoot objectAtIndex:1];
        
        
    }
//    v1.hidden = YES;
}

-(void)initVIP{
    FithVIPViewController *vip = [[FithVIPViewController alloc] init];
    vip.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vip animated:YES];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
        return 10.0f;
    
    }
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 10;//设置你footer高度
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [_tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view removeFromSuperview ];
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
