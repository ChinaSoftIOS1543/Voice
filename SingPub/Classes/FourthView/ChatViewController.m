//
//  ChatViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "ChatViewController.h"
#import "FourthMessageCell.h"
#import "FourthEngineInterface.h"
#import "ChatChooseViewController.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>{
   
     NSDictionary* _itemLists;
     UIView* _headView;
}

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息列表";
     [self initNavigation];
     [self initTableView];
     [self getCellInfoDataSource];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)initNavigation{
     UIImage* leftImage = [UIImage imageNamed:@"offline_colloction"];
     UIImage* rightImage = [UIImage imageNamed:@"mini_paly_btn_normal.png"];
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClicked:)];
     
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClicked:) ];
     
}

-(void)leftBarButtonClicked:(id)sender{
     NSLog(@"left");
     if (sender && [sender isKindOfClass:[UIBarButtonItem class]]) {
          ChatChooseViewController* chat = [[ChatChooseViewController alloc] init];
          [self.navigationController pushViewController:chat animated:YES];
     }
     
}

-(void)rightBarButtonClicked:(id)sender{
     NSLog(@"right");
}

-(void)initTableView{
     
     [self setEdgesForExtendedLayout:UIRectEdgeNone];
     
     _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped ];
     
     _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
     
     _tableView.dataSource = self;
     _tableView.delegate = self;
     
     //_tableView.backgroundColor = [UIColor blueColor];
     
     _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
     
     _tableView.showsHorizontalScrollIndicator = NO;
     
     _tableView.showsVerticalScrollIndicator = NO;
     
     _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 34)];
     
     _headView.backgroundColor = [UIColor blueColor];
     
    // UIImage* image = [UIImage imageNamed:@""];
     
     
     UIImageView* searchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search1.png"]];
     
     UITapGestureRecognizer* searchTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchBarClicked:)];
     
     [searchView addGestureRecognizer:searchTap];
     
     searchView.userInteractionEnabled =YES;
     
     [_headView addSubview:searchView];
     
     _tableView.tableHeaderView = _headView;
     
     [self.view addSubview:_tableView];

}

-(void)searchBarClicked:(id)sender{
     if (sender && [sender isKindOfClass: [UIGestureRecognizer class]]) {
          NSLog(@"search");
     }
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
     
   _itemLists = [[FourthEngineInterface shareInstance] getFourthCellDataSource];
     
}


@end
