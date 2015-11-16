//
//  ThirdRequestSongView.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdRequestSongView.h"

#import "ThirdSingingHeaderView.h"
#import "ThirdSingingTableViewCell.h"
#import "ThirdSingingTableViewCellData.h"
#import "ThirdEngineInterface.h"

#import "SingStarViewController.h"
#import "ClassifyViewController.h"
#import "WonderfulViewController.h"
#import "SingSongViewController.h"


@interface ThirdRequestSongView ()<UITableViewDataSource,UITableViewDelegate,ThirdSingingTableViewCellDelegate,ThirdSingingHeaderViewDelegate>
{
    UITableView * _tableView;
    
    NSMutableDictionary * _itemLists;
    
    NSArray * _miniArray;
}

@property(nonatomic,strong)ThirdSingingTableViewCell * cell;
@property(nonatomic,strong)ThirdSingingHeaderView * headerView;
@end


@implementation ThirdRequestSongView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
       [self initTableView];
        
        [self getTableDataSource];
    }
    
    return self;
}

#pragma mark- TableView
-(ThirdSingingHeaderView *)singingHeaderView
{
    if (_headerView ==nil)
    {
        _headerView = [[ThirdSingingHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 210)];
        
        _headerView.delegate = self;
    }
    
    return _headerView;
}
//调用Engine层的数据
-(void)getTableDataSource
{
    _itemLists = (NSMutableDictionary *)[[ThirdEngineInterface shareInstance] getThirdSingingTableViewData];
}

-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStylePlain];
    
    _tableView.backgroundColor = [UIColor whiteColor];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    //调用headerView数据
    _tableView.tableHeaderView = self.singingHeaderView;
    
    self.headerView.headerData = [[ThirdEngineInterface shareInstance] getThirdSingingHeaderViewData];
    
    [self.headerView updateSingingHeaderView];
    
    UIView * footView = [[UIView alloc ] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-40, SCREEN_WIDTH, 80)];
    
    footView.backgroundColor = [UIColor yellowColor];
    
    _tableView.tableFooterView = footView;
    
    [self addSubview:_tableView];

}

#pragma mark- UITableViewDataSource
//TableView的section有几个
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _itemLists.count;
}

//每个section有几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *) [_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)section+1]]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellType = @"cellType";
    
    _cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (_cell == nil)
    {
        _cell = [[ThirdSingingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
        _cell.delegate = self;
    }
    
    NSArray * items = [_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)indexPath.section+1]];
    
    if (indexPath.row >= 0 && indexPath.row <items.count)
    {
        if(indexPath.section == 0)
        {
            _miniArray = (NSArray *)[_itemLists objectForKey:[NSString stringWithFormat:@"array%ld",(long)indexPath.section+1]];
        
            ThirdSingingTableViewCellData * singing = [_miniArray objectAtIndex:indexPath.row];
        
            _cell.Data = singing;
        
            //        //设置箭头
            //        _cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if(indexPath.section == 1)
        {
            

        }
    }
    
    [_cell updateSingingCell];
    
    return _cell;
}

#pragma mark- UITableViewDelegate
//每个cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
         return 65;
    }else
    {
        return 100;
    }
    
}

//距离headerView的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}

//section的停靠
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    headView.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1];
    
    UILabel * _littleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 2, 16)];
    
    _littleLabel1.backgroundColor = [UIColor orangeColor];
    
    [headView addSubview:_littleLabel1];
    
    if(section == 0)
    {
        UILabel * _littleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_littleLabel1.frame)+8, 10, 100, 10)];
    
        _littleLabel2.font = [UIFont systemFontOfSize:12];
    
        _littleLabel2.tintColor = [UIColor blackColor];
    
        _littleLabel2.text = @"推荐歌曲";
    
        [headView addSubview:_littleLabel2];
    }
    
    return headView;
}

////加上这段函数就不停靠
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat sectionHeaderHeight = 20;
//    
//    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y>=0)
//    {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y,0, 0,0);
//    }else if (scrollView.contentOffset.y >= sectionHeaderHeight)
//    {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"推荐歌曲");
}

#pragma mark- ThirdSingingTableViewCellDelegate
-(void)ThirdSingingCellClickedWithImageView
{
    NSLog(@"演唱");
}

#pragma mark- ThirdSingingHeaderViewDelegate
-(void)logoSingingHeaderViewClicked:(id)sender
{
    
    if (sender && [sender isKindOfClass:[UIButton class]])
    {
        UIButton * bt = (UIButton *)sender;
        
        switch (bt.tag)
        {
            case Request_Button:
            {
                UIViewController * viewController = [self findViewController:self];
                
                SingStarViewController * singStarViewCon = [[SingStarViewController alloc] init];
                
                [viewController.navigationController pushViewController:singStarViewCon animated:YES];
            }
                break;
            case Classify_Button:
            {
                UIViewController * viewController = [self findViewController:self];
                
                ClassifyViewController * classifyViewCon = [[ClassifyViewController alloc] init];
                
                [viewController.navigationController pushViewController:classifyViewCon animated:YES];
               
            }
                break;
            case Wonderful_Button:
            {
                UIViewController * viewController = [self findViewController:self];
                
                WonderfulViewController * wonderViewCon = [[WonderfulViewController alloc] init];
                
                [viewController.navigationController pushViewController:wonderViewCon animated:YES];
            }
                break;
            case SingSong_Button:
            {
                UIViewController * viewController = [self findViewController:self];
                
                SingSongViewController * singSongViewCon = [[SingSongViewController alloc] init];
                
                [viewController.navigationController pushViewController:singSongViewCon animated:YES];
            }
                break;
            default:
                break;
        }
    }
}



//获取当前的ViewController
- (UIViewController *)findViewController:(UIView *)sourceView
{
    id target=sourceView;
    
    while (target)
    {
        target = ((UIResponder *)target).nextResponder;
        
        if ([target isKindOfClass:[UIViewController class]])
        {
            break;
        }
    }
    return target;
}
















@end
