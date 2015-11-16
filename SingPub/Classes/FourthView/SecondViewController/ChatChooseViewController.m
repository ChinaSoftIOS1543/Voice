//
//  ChatChooseViewController.m
//  SingPub
//
//  Created by 中软mini007 on 15/11/12.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ChatChooseViewController.h"
#import "FourthSecondChatCell.h"
#import "FourthEngineInterface.h"


@interface ChatChooseViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView* _tableView;
    NSDictionary* _itemLists;
    UIView* _headView;
}

@end

@implementation ChatChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigation];
    [self initTableView];
    [self getCellInfoDataSource];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}



-(void)initNavigation{
    self.navigationItem.title = @"选择聊天对象";
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加好友" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClicked:)];
}


-(void)rightBarButtonClicked:(id)sender{
    NSLog(@"添加好友");
}

-(void)initTableView{
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped ];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 68)];
    
    _headView.backgroundColor = [UIColor blueColor];
    
    
    UIImageView* searchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search1.png"]];
    
    UITapGestureRecognizer* searchTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchBarClicked:)];
    
    [searchView addGestureRecognizer:searchTap];
    
    searchView.userInteractionEnabled =YES;
    
    [_headView addSubview:searchView];
    
    UIImageView* makeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search1.png"]];
    
    makeView.frame = CGRectMake(0, 34, SCREEN_WIDTH, 34);
    
    UITapGestureRecognizer* makeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(makeBarClicked:)];
    
    [makeView addGestureRecognizer:makeTap];
    
    makeView.userInteractionEnabled = YES;
    
    [_headView addSubview:makeView];
    
    _tableView.tableHeaderView = _headView;
    
    [self.view addSubview:_tableView];

}

-(void)searchBarClicked:(id)sender{
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ((NSArray*)[_itemLists objectForKey:[NSString stringWithFormat:@"array%d", section+1]]).count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellType = @"cellType";
    
    FourthSecondChatCell* cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (cell == nil) {
        cell = [[FourthSecondChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
    }
    NSArray* items = [_itemLists objectForKey:[NSString stringWithFormat:@"array%d", indexPath.section+1]];
    
    if (indexPath.row >= 0 && indexPath.row < items.count) {
        
        NSArray* buyArray = (NSArray*)[_itemLists objectForKey:[NSString stringWithFormat:@"array%d", indexPath.section+1]];
        FourthSecondChatCellData* chat = [buyArray objectAtIndex:indexPath.row];
        cell.data = chat;
    }
    [cell updateChatCell];
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    
    switch (indexPath.row) {
        case 0:{
            
        }
            
            break;
        case 1:{
            
        }
            
            break;
        case 2:{
            
        }
            
            break;
            
        default:
            
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

#pragma mark - getgetDataSource

-(void)getCellInfoDataSource{
    
    _itemLists = [[FourthEngineInterface shareInstance] getFourthSecondCellDataSource];
    
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
