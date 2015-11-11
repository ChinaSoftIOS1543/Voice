//
//  FithGameViewController.m
//  SingPub
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithGameViewController.h"
#import "FithGameTableViewCell.h"
#import "FithBannerView.h"
#import "Engin.h"

@interface FithGameViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSDictionary *_itemsLists;
    FithGameTableViewCell *cell;
    UIView *headView;
}
@end

@implementation FithGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)initUI{
    self.navigationItem.title = @"游戏中心";
    self.navigationItem.rightBarButtonItem.title = @"游戏消息";
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor colorWithRed:215/255.0f green:161/255.0f blue:57/255.0f alpha:1.0f]];
    [self getTableViewDataSource];
    [self initTabView];
}

-(void)getTableViewDataSource{
    _itemsLists = [[Engin sharInstance] getFithGamedata];
}

-(void)initTabView{
    //初始化
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
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
    
    
    _tableView.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
    [self.view addSubview:_tableView];
    
//    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 130)];
//    headView.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
//    _tableView.tableHeaderView = headView;
    NSMutableArray *imgLists = [NSMutableArray array];
    for (int index = 0; index < 4; index++) {
        NSString *imageName = [NSString stringWithFormat:@"img%d.jpg",index+1];
        [imgLists addObject:imageName];
    }
    FithBannerView *bannerView = (FithBannerView *)[FithBannerView showBannerWithImageArr:imgLists];
    _tableView.tableHeaderView = bannerView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30.0f;
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
        cell = [[FithGameTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
    }
    
    NSArray *items = [_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
    
    int x = (int)items.count;
    if (indexPath.row>=0 && indexPath.row < x) {
        NSArray *mineArray = (NSArray *)[_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
        FithGameData *mine = [mineArray objectAtIndex:indexPath.row];
        cell.data = mine;
        
        
    }
    
    
    [cell updateFithGamedata];
    
    return cell;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 30;//设置你footer高度
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    
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
