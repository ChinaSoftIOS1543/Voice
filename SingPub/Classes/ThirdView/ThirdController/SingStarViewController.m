//
//  SingStarViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/11.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SingStarViewController.h"

#import "ThirdSingStarTableViewCell.h"
#import "ThirdSingStarTableViewCellData.h"

#import "ThirdEngineInterface.h"


@interface SingStarViewController ()<UITableViewDataSource,UITableViewDelegate,ThirdSingStarTableViewCellDelegate>
{
    UITableView * _tableView;
    
    NSDictionary * _itemLists;
    
    NSArray * _miniArray;
}

@property(nonatomic,strong)ThirdSingStarTableViewCell * cell;


@end


@implementation SingStarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.title = @"歌星点歌";
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:61/255.0 green:62/255.0 blue:63/255.0 alpha:1],NSForegroundColorAttributeName, nil]];
    
    [self navigationBar];
    
    [self initTableView];
    
    [self getTableDataSources];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

-(void)navigationBar
{
    UIImage * leftImage = [[UIImage imageNamed:@"arrow@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage  style:UIBarButtonItemStylePlain target:self action:@selector(backBtn:)];
}

-(void)backBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)getTableDataSources
{
    _itemLists = [[ThirdEngineInterface shareInstance] getThirdSingStarTableViewData];
}

-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    _tableView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:246/255.0 alpha:1];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    headerView.backgroundColor = [UIColor clearColor];
    _tableView.tableHeaderView = headerView;
    
    [self.view addSubview:_tableView];
}


#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"starArray%ld",(long)section+1]]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellType = @"cellType";
    
    _cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (_cell == nil)
    {
        _cell = [[ThirdSingStarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
        _cell.delegate = self;
    
    }
    
    NSArray * items = [_itemLists objectForKey:[NSString stringWithFormat:@"starArray%ld",(long)indexPath.section+1]];
    if (indexPath.row >=0 && indexPath.row < items.count)
    {
        _miniArray = (NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"starArray%ld",(long)indexPath.section+1]];
        
        ThirdSingStarTableViewCellData * singStar = [_miniArray objectAtIndex:indexPath.row];
        
        _cell.Data =singStar;
    }
    
    [_cell updateSingStarCell];
    
    return _cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _itemLists.count;
}


#pragma mark- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"star");
}
#pragma mark- ThirdSingStarTableViewCellDelegate

-(void)ThirdSingStarClickedWithImageView
{
    
}
















@end
