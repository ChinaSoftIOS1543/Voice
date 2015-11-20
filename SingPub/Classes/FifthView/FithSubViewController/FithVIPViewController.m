//
//  FithVIPViewController.m
//  SingPub
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithVIPViewController.h"
#import "FithVipTableViewCell.h"
#import "Engin.h"
@interface FithVIPViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSDictionary *_itemsLists;
    FithVipTableViewCell *cell;
    UIView *headView;
}
@end

@implementation FithVIPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getTableViewDataSource];
    [self initTabView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)getTableViewDataSource{
    _itemsLists = [[Engin sharInstance] getFithVipdata];
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
    
    headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    headView.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
    _tableView.tableHeaderView = headView;
    
    UIView *userView = [[UIView alloc] init];
    userView.frame = CGRectMake(10, 10, SCREEN_WIDTH-10*2, 64);
    //测试用户栏位置
    userView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:userView];
    
    UIImageView *image = [[UIImageView alloc] init];
    image.frame = CGRectMake(10, 10, 44, 44);
    image.layer.cornerRadius = 22.0f;
    //测试头像位置
    image.backgroundColor = [UIColor blackColor];
    [userView addSubview:image];
    
    //判断当前用户
    UILabel *userName = [[UILabel alloc] init];
    userName.frame = CGRectMake(CGRectGetMaxX(image.frame)+10, 10, SCREEN_WIDTH-10*2, 12);
    userName.text = @"敬兒";
    userName.font = [UIFont systemFontOfSize:14];
    [userView addSubview:userName];
    
    UILabel *userMassger = [[UILabel alloc] init];
    userMassger.frame = CGRectMake(CGRectGetMaxX(image.frame)+10, CGRectGetMaxY(userName.frame)+5, SCREEN_WIDTH-44-10-10-10-10-10, 30);
    userMassger.numberOfLines = 2;
    //需要判断
    userMassger.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    userMassger.text = @"你现在不是唱吧会员，无法享受对应的特权和服务";
    userMassger.textAlignment = NSTextAlignmentLeft;
    userMassger.font = [UIFont systemFontOfSize:12];
    [userView addSubview:userMassger];
    
    UIButton *becomeVip = [[UIButton alloc] init];
    becomeVip.frame = CGRectMake(10, CGRectGetMaxY(userView.frame)+10, SCREEN_WIDTH-10*2, 40);
    becomeVip.backgroundColor = [UIColor orangeColor];
    [becomeVip setTitle:@"开通会员" forState:UIControlStateNormal];
    becomeVip.titleLabel.font = [UIFont systemFontOfSize:14];
    [becomeVip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [headView addSubview:becomeVip];
    
    UIImageView *advImage = [[UIImageView alloc] init];
    advImage.frame = CGRectMake(0, CGRectGetMaxY(becomeVip.frame)+10, SCREEN_WIDTH, 64);
    advImage.backgroundColor = [UIColor yellowColor];
    [headView addSubview:advImage];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0f;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if (section == _itemsLists.count-1) {
//        return 0.0f;
//    }
//    return 30.0f;
//}

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
        cell = [[FithVipTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
    }
    
    NSArray *items = [_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
    
    int x = (int)items.count;
    if (indexPath.row>=0 && indexPath.row < x) {
        NSArray *mineArray = (NSArray *)[_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
        FithVIPData *mine = [mineArray objectAtIndex:indexPath.row];
        cell.data = mine;
        
    }
   
    
    [cell updateFithVipdata];
    
    return cell;
    
}

#pragma mark - SectionHeaderView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
        header.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
        UIImageView *line = [[UIImageView alloc] init];
        line.frame = CGRectMake(5, 5, 10, 20);
        line.backgroundColor = [UIColor redColor];
        [header addSubview:line];
        line.backgroundColor = [UIColor blackColor];
    UILabel *lb = [[UILabel alloc] init];
    lb.frame = CGRectMake(CGRectGetMaxX(line.frame)+10, 5, SCREEN_WIDTH, 20);
    lb.font = [UIFont systemFontOfSize:12];
    lb.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    [header addSubview:lb];
    if (section == 0) {
        lb.text = @"基础特权";
    }
    if (section == 1) {
        lb.text = @"炫酷特权";
    }
    if (section == 2) {
        lb.text = @"上限提升特权";
    }
    if (section == 3) {
        lb.text = @"表情商店特权";
    }
    return header;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 45;//设置你footer高度
    
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
