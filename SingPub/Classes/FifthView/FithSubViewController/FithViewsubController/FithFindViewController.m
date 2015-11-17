//
//  FithFindViewController.m
//  SingPub
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithFindViewController.h"
#import "FithFindFrTableViewCell.h"
#import "Engin.h"

@interface FithFindViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    UITableView *_tableView;
    NSDictionary *_itemsLists;
    FithFindFrTableViewCell *cell;
    UIView *headView;
}
@end

@implementation FithFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    self.navigationItem.title = @"找好友";
    self.navigationItem.rightBarButtonItem.title = @"邀请好友";
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:215/255.0f green:161/255.0f blue:57/255.0f alpha:1.0f];
    [self getTableViewDataSource];
    [self initTableView];
    
}
-(void)getTableViewDataSource{
    _itemsLists = [[Engin sharInstance] getFindFrdata];
}

-(void)initTableView{
    CGRect frame = self.view.frame;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    //代理类
    _tableView.delegate = self;
    //数据源
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    headView = [[UIView alloc] init];
    headView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 240);
    
//    headView.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
    headView.backgroundColor = [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0];
    _tableView.tableHeaderView = headView;
    UIImageView *searchView = [[UIImageView alloc] init];
    searchView.frame = CGRectMake(10, 7, SCREEN_WIDTH-10*2, 40);
    searchView.backgroundColor = [UIColor whiteColor];
    searchView.layer.cornerRadius = 5.0f;
    [headView addSubview:searchView];
    
    UIView *view1 = [[UIView alloc] init];
    //测试
    view1 = [self viewWithimage:nil title:@"新浪微博" ind:@"查找新浪微博好友" tag:3300 frame:CGRectMake(0, CGRectGetMaxY(searchView.frame)+7, SCREEN_WIDTH, 60)];
    
    UIView *view2 = [[UIView alloc] init];
    view2 = [self viewWithimage:nil title:@"腾讯微博" ind:@"查找腾讯微博好友" tag:3301 frame:CGRectMake(0, CGRectGetMaxY(view1.frame)+0.5, SCREEN_WIDTH, 60)];
    
    UIView *view3 = [[UIView alloc] init];
    view3 = [self viewWithimage:nil title:@"手机联系人" ind:@"查找手机联系人中的好友" tag:3302 frame:CGRectMake(0, CGRectGetMaxY(view2.frame)+0.5, SCREEN_WIDTH, 60)];
    
    
}
-(UIView*)viewWithimage:(NSString *)image title:(NSString *)Title ind:(NSString *)ind tag:(NSInteger)tag frame:(CGRect)frame{
    UIView *view = [[UIView alloc] init];
    view.frame = frame;
    view.backgroundColor = [UIColor whiteColor];
    view.tag = tag;
    
    UIImageView *img = [[UIImageView alloc] init];
    img.frame = CGRectMake(7, 10, 40, 40);
    img.image = [UIImage imageNamed:image];
    img.backgroundColor = [UIColor redColor];
    [view addSubview:img];
    
    UILabel *lb1 = [[UILabel alloc] init];
    lb1.frame = CGRectMake(CGRectGetMaxX(img.frame)+7, 7, 60, 20);
    lb1.text = Title;
    lb1.font = [UIFont systemFontOfSize:14];
    
    [view addSubview:lb1];
    
    UILabel *lb2 = [[UILabel alloc] init];
    lb2.frame = CGRectMake(CGRectGetMaxX(img.frame)+7, CGRectGetMaxY(lb1.frame), 140, 30);
    lb2.text = ind;
    [view addSubview:lb2];
    lb2.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    lb2.font = [UIFont systemFontOfSize:12];
    
    [headView addSubview:view];
    return view;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cell.frame.size.height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30.0f;
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _itemsLists.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return ((NSArray *)[_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long)section+1]]).count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellType = @"cellType";
    cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (cell == nil) {
        cell = [[FithFindFrTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
        
    }
    
    NSArray *items = [_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
    
    int x = (int)items.count;
    if (indexPath.row>=0 && indexPath.row < x) {
        NSArray *mineArray = (NSArray *)[_itemsLists objectForKey:[NSString stringWithFormat:@"arr%ld",(long )indexPath.section+1]];
        FithFindFrData *mine = [mineArray objectAtIndex:indexPath.row];
        cell.data = mine;
        
        
    }
    
    
    [cell updateFithFindFrdata];
    
    return cell;
    
}

#pragma mark - SectionHeaderView
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
    header.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0];
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
    
    return header;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
