//
//  FithSetViewController.m
//  SingPub
//
//  Created by apple on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithSetViewController.h"
#import "FithSetTableViewCell.h"
#import "Engin.h"
#define switch1_tag 6100
#define switch2_tag 6101
#define switch3_tag 6102
@interface FithSetViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{
    UITableView *_tableView;
    NSDictionary *_itemsLists;
    UILabel *chooseLab;
    FithSetTableViewCell *cell;
    UIView *_rootView;
    UILabel *rootlable;
    UIButton *rootbtn;
    NSUserDefaults *default1;
}
@end

@implementation FithSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    //修改图片名
  //  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow.png"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtn:)];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone target:self action:@selector(rightBtn:)];
//    self.navigationItem.title = @"发现";
    [self getTableViewDataSource];
    [self initTabView];
    
}

-(void)getTableViewDataSource{
    _itemsLists = [[Engin sharInstance] getFindSetdata];
}

-(void)initTabView{
    //初始化
    _tableView = [[UITableView alloc] initWithFrame:([UIScreen mainScreen].bounds) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    //决定子视图的显示范围，yes裁剪，no不裁剪
    _tableView.clipsToBounds = NO;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //自动调整高度，保证与superView顶部和底部的距离不变
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    
    _tableView.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
    [self.view addSubview:_tableView];
    
    _rootView = [[UIView alloc] init];
    _rootView .frame = CGRectMake(0, 0, SCREEN_WIDTH, 110);
    _rootView.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
    _tableView.tableFooterView = _rootView;
    
    rootlable = [[UILabel alloc] init];
    rootlable.frame = CGRectMake(5, 0, SCREEN_WIDTH-10, 60);
    rootlable.numberOfLines = 3;
    rootlable.text = @"开启后，下次录歌时你的录音将被压缩成较小格式，上传加快，但保存会变得非常慢，建议仅在网速较慢或上传经常失败的情况下开启";
    rootlable.textAlignment = NSTextAlignmentCenter;
    rootlable.font = [UIFont systemFontOfSize:13];
    rootlable.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    //rootlable.backgroundColor = [UIColor blackColor];
    [_rootView addSubview:rootlable];
    
    rootbtn = [[UIButton alloc] init];
    rootbtn.frame = CGRectMake(5, CGRectGetMaxY(rootlable.frame), SCREEN_WIDTH-10, 35);
    rootbtn.backgroundColor = [UIColor colorWithRed:255/255.0f green:134/255.0f blue:0/255.0f alpha:1.0f];
    [rootbtn setTitle:@"退出登陆" forState:UIControlStateNormal];
    [_rootView addSubview:rootbtn];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == _itemsLists.count-1) {
        return 0.0f;
    }
    return 10.0f;
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
    cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (cell == nil) {
        cell = [[FithSetTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
    }
    
    NSArray *items = [_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
    
    int x = (int)items.count;
    if (indexPath.row>=0 && indexPath.row < x) {
        NSArray *mineArray = (NSArray *)[_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
        FithSetData *mine = [mineArray objectAtIndex:indexPath.row];
        cell.data = mine;
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                UISwitch *switch1 = [[UISwitch alloc] init];
                switch1.tag = switch1_tag;
                switch1.frame = CGRectMake(SCREEN_WIDTH-60, 5, 0, 0);
                NSNumber* volue = [[NSUserDefaults standardUserDefaults] objectForKey:@"switch1"] ;
                if (volue) {
                    [switch1 setOn:[volue boolValue] animated:YES];
                }
                
                [switch1 addTarget:self action:@selector(switchClicked:) forControlEvents:(UIControlEventValueChanged)];
                
                
                [cell addSubview:switch1];
            }
            if (indexPath.row == 1) {
                UISwitch *switch2 = [[UISwitch alloc] init];
                switch2.tag = switch2_tag;
                switch2.frame = CGRectMake(SCREEN_WIDTH-60, 5, 0, 0);
                NSNumber* volue = [[NSUserDefaults standardUserDefaults] objectForKey:@"switch2"] ;
                if (volue) {
                    [switch2 setOn:[volue boolValue] animated:YES];
                }
                
                [switch2 addTarget:self action:@selector(switchClicked:) forControlEvents:(UIControlEventValueChanged)];
                
                
                [cell addSubview:switch2];
            }
            if (indexPath.row == 2) {
                chooseLab = [[UILabel alloc] init];
                chooseLab.frame = CGRectMake(SCREEN_WIDTH-170, (45-30)/2, 140, 30);
                chooseLab.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"buttontitle"];
                chooseLab.font = [UIFont systemFontOfSize:12];
                chooseLab.textAlignment = NSTextAlignmentRight;
                chooseLab.textColor = [UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:0.9f];
                [cell addSubview:chooseLab];
            }
        }
        if (indexPath.section == 3) {
            UISwitch *switch3 = [[UISwitch alloc] init];
            switch3.tag = switch3_tag;
            switch3.frame = CGRectMake(SCREEN_WIDTH-60, 5, 0, 0);
            NSNumber* volue = [[NSUserDefaults standardUserDefaults] objectForKey:@"switch3"] ;
            if (volue) {
                [switch3 setOn:[volue boolValue] animated:YES];
            }
            
            [switch3 addTarget:self action:@selector(switchClicked:) forControlEvents:(UIControlEventValueChanged)];
            
            
            [cell addSubview:switch3];
        }
    }
    cell.accessoryType = UITableViewCellAccessoryNone;

    [cell updateFithSetCell];
    
    return cell;
    
}
//设置switch的开关状态
-(void)switchClicked:(id)sender{
    
    if (sender && [sender isKindOfClass:[UISwitch class]]) {
        UISwitch* swt = (UISwitch*)sender;
        switch (swt.tag) {
            case switch1_tag:
                if (!swt.isOn) {
                    [swt setOn:NO animated:YES];
                    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:NO] forKey:@"switch1"];
                }else{
                    [swt setOn:YES animated:YES];
                    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:@"switch1"];
                }
                break;
            case switch2_tag:
                if (!swt.isOn) {
                    [swt setOn:NO animated:YES];
                    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:NO] forKey:@"switch2"];
                }else{
                    [swt setOn:YES animated:YES];
                    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:@"switch2"];
                }
                break;
            case switch3_tag:
                if (!swt.isOn) {
                    [swt setOn:NO animated:YES];
                    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:NO] forKey:@"switch3"];
                }else{
                    [swt setOn:YES animated:YES];
                    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:@"switch3"];
                }
                break;
                
            default:
                break;
        }
        
        
    }
}

#pragma mark - UITableViewDelegate
//各栏事件

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            UIActionSheet * Chooseplay = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"仅在Wifi网络下播放",@"任何网络下均播放视频",@"始终不播放视频", nil];
            [Chooseplay showInView:self.view];
            
        }
    }
    
    if (indexPath.section == 2) {
        if(indexPath.row == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"确定要清楚所有缓存文件吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
    }
    }
}




#pragma mark - ActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        chooseLab.text = @"仅在Wifi网络下播放";
    }
    if (buttonIndex == 1) {
        chooseLab.text = @"任何网络下均播放视频";
    }
    if (buttonIndex == 2) {
        chooseLab.text = @"始终不播放视频";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tableView reloadData];
    chooseLab.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"buttontitle"];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view removeFromSuperview ];
    [[NSUserDefaults standardUserDefaults] setObject:chooseLab.text forKey:@"buttontitle"];
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
