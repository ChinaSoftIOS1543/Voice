//
//  ClassifyViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/11.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ClassifyViewController.h"

#import "ThirdClassifyTableViewCell.h"
#import "ThirdClassifyTableViewCellData.h"

#import "ThirdEngineInterface.h"

@interface ClassifyViewController ()<UITableViewDataSource,UITableViewDelegate,ThirdClassifyTableViewCellDelegate>
{
    UITableView * _tableView;
    
    NSDictionary * _itemLists;
    
   // NSArray * _miniArray;
}

@property(nonatomic,strong)ThirdClassifyTableViewCell * cell;

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.navigationItem.title = @"分类点歌";
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:61/255.0 green:62/255.0 blue:63/255.0 alpha:1],NSForegroundColorAttributeName, nil]];
    
    [self navigationBar];
    
    [self initTableView];
    
    [self getClassifyTableData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

-(void)navigationBar
{
    UIImage * image = [[UIImage imageNamed:@"arrow@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(backBtn:)];
 }

-(void)backBtn:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)getClassifyTableData
{
    _itemLists = [[ThirdEngineInterface shareInstance] getThirdClassifyTableViewData];
}

-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    
    
    [self.view addSubview:_tableView];
}


#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"classArray%ld",(long)section+1]]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellType = @"cellType";
    
    _cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (_cell == nil)
    {
        _cell = [[ThirdClassifyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
        _cell.delegate = self;
    }
    
    NSArray * items = [_itemLists objectForKey:[NSString stringWithFormat:@"classArray%ld",(long)indexPath.section+1]];
    
    if (indexPath.row >=0 && indexPath.row < items.count)
    {
//        _miniArray = (NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"classArray%ld",(long)indexPath.section+1]];
        
        ThirdClassifyTableViewCellData * classify = [items objectAtIndex:indexPath.row];
        
        _cell.Data = classify;
    }
    
    [_cell updateClassifyCell];
    
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
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"classify");
}
#pragma mark- ThirdClassifyTableViewCellDelegate
-(void)ThirdClassifyClickedWithImageView
{
    
}

@end
