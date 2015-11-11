//
//  ChatViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "ChatViewController.h"
#import "FourthMessageCell.h"


@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView* _messageTableView;
    NSDictionary* _itemLists;
    UISegmentedControl* _segm;
    BOOL _defaultAllStore;
}

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMessageTableView];
    
    [self getTableViewDataSource];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_messageTableView reloadData];
    
    [self initNavigationBar];
    
}
-(void)initNavigationBar{
    UIView* naviView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, 64)];
    naviView.backgroundColor = [UIColor whiteColor];
    naviView.alpha = 1;
    //左left button 设置
    UIImageView* leftBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_room_icon.png"]];
    leftBar.frame = CGRectMake(5, 26, 50, 35) ;
    UITapGestureRecognizer* lefgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftBarClicked:)];
    leftBar.userInteractionEnabled = YES;
    [leftBar addGestureRecognizer:lefgTap];
    
    [naviView addSubview:leftBar];
    
    //right button
    UIImageView* rightBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_room_icon.png"]];
    rightBar.frame = CGRectMake(SCREEN_WIDTH-35, 30, 24, 24) ;
    UITapGestureRecognizer* rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightBarClicked:)];
    rightBar.userInteractionEnabled = YES;
    [rightBar addGestureRecognizer:rightTap];
    
    [naviView addSubview:rightBar];
    
    NSArray* items = [NSArray arrayWithObjects:@"消息列表",@"附近群组", nil];
    _segm = [[UISegmentedControl alloc] initWithItems:items];
    _segm.frame = CGRectMake(SCREEN_WIDTH/2-180/2, 30, 180, 24);
    _segm.tintColor = [UIColor colorWithRed:131/255.0 green:198/255.0 blue:192/255.0 alpha:1];
    
    //设置segm点击属性
    [_segm addTarget:self action:@selector(segmClicked:) forControlEvents:UIControlEventValueChanged];
    
    //_segm.selectedSegmentIndex = 0;
    
    
    [naviView addSubview:_segm];
    
    [self.navigationController.navigationBar addSubview:naviView];
    
    NSNumber* num = [[NSUserDefaults standardUserDefaults] objectForKey:@"AllStore"];
    
    if (num) {
        _segm.selectedSegmentIndex = [num intValue];
    }else{
        _segm.selectedSegmentIndex = 0;
    }
    
}

-(void)leftBarClicked:(id)sender{
    if (sender) {
        NSLog(@"left");
    }
}

-(void)rightBarClicked:(id)sender{
    NSLog(@"right");
}

-(void)segmClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl* segm = (UISegmentedControl*)sender;
        
        switch (segm.selectedSegmentIndex) {
            case 0:
            {
                _defaultAllStore = NO;
                
                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:0] forKey:@"AllStore"];
                [self initMessageTableView];
            }
                 break;
            case 1:
            {
                _defaultAllStore = YES;
                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:1] forKey:@"AllStore"];
                [_messageTableView removeFromSuperview];
            }
                 break;
            default:
                break;
        }
        
        
    }
    
    NSLog(@"%ld",(long)_segm.selectedSegmentIndex);
}

-(void)initMessageTableView{
    _messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain ];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    _messageTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    _messageTableView.dataSource = self;
    _messageTableView.delegate = self;
    
    //_messageTableView.backgroundColor = [UIColor blueColor];
    _messageTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _messageTableView.showsHorizontalScrollIndicator = NO;
    
    _messageTableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_messageTableView];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemLists.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ((NSArray*)[_itemLists objectForKey:[NSString stringWithFormat:@"array%d", section+1]]).count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellType = @"cellType";
    
    FourthMessageCell* cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (cell == nil) {
        cell = [[FourthMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
        
    }
    NSArray* items = [_itemLists objectForKey:[NSString stringWithFormat:@"array%d", indexPath.section+1]];
    
    if (indexPath.row >= 0 && indexPath.row < items.count) {
        
        NSArray* buyArray = (NSArray*)[_itemLists objectForKey:[NSString stringWithFormat:@"array%d", indexPath.section+1]];
        FourthMessageCellData* message = [buyArray objectAtIndex:indexPath.row];
        cell.data = message;
    }
    [cell updateMessageCell];
    return cell;
}

-(void)getTableViewDataSource{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    NSMutableArray* array1 = [[NSMutableArray alloc] init];
    
    FourthMessageCellData* data11 = [[FourthMessageCellData alloc] init];
    data11.imageName = @"";
    data11.title1Name = @"编辑精选";
    data11.title2Name = @"K歌秘籍之如何制服麦霸，抢回属于";
    data11.title3Name = @"昨天";
    [array1 addObject:data11];
    
    FourthMessageCellData* data22 = [[FourthMessageCellData alloc] init];
    data22.imageName = @"";
    data22.title1Name = @"官方公告";
    data22.title2Name = @"恭喜你！获得。。。。。。";
    data22.title3Name = @"11-01";
    [array1 addObject:data22];
    
    FourthMessageCellData* data33 = [[FourthMessageCellData alloc] init];
    data33.imageName = @"";
    data33.title1Name = @"你还没有加入群聊";
    data33.title2Name = @"假如一个志同道合的。。。。";
    data33.title3Name = @"10-30";
    [array1 addObject:data33];
    
    
    [dic setObject:array1 forKey:@"array1"];
    
    _itemLists = dic;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64.5f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == _itemLists.count) {
        return 0.0f;
    }
    return 80.0f;
}


@end
