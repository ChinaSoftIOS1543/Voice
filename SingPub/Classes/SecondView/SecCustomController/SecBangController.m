//
//  SecBangController.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/5.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecBangController.h"

#define Left_TableView 3050
#define Right_TableView 3051

@interface SecBangController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UIScrollView * _scroller;
    UISegmentedControl * _seg;
    UISearchBar * _search;
    UIView * _rightView;
    
}

@end

@implementation SecBangController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.view.backgroundColor=[UIColor grayColor];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
-(void)initUI
{
    UIView * navView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    navView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:navView];
    
    UIButton * btn=[[UIButton alloc] initWithFrame:CGRectMake(10, 20, 40, 40)];
    btn.backgroundColor=[UIColor blueColor];
    [navView addSubview:btn];
    [btn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *item=[[NSArray alloc] initWithObjects:@"地区榜",@"兴趣榜", nil];
    _seg=[[UISegmentedControl alloc] initWithItems:item];
    _seg.frame=CGRectMake((SCREEN_WIDTH-80)/2, 24, 80, 40);
    _seg.tintColor=[UIColor grayColor];
    _seg.selectedSegmentIndex=0;
    [_seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    [navView addSubview:_seg];
    
    _scroller=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    //_scroller.backgroundColor=[UIColor redColor];
    _scroller.contentSize=CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT-64);
    _scroller.pagingEnabled=YES;
    _scroller.bounces=NO;
    _scroller.showsHorizontalScrollIndicator=NO;
    _scroller.delegate=self;
    [self initTable];
    [self.view addSubview:_scroller];
    
    EngineInterface *engin=[[EngineInterface alloc] init];
    NSDictionary *dic=[[NSDictionary alloc]initWithDictionary:[engin readPlist]];
    _rightView=[[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    _rightView.backgroundColor=[UIColor redColor];
    [self initRightView];
     [_scroller addSubview:_rightView];
    //search.scopeButtonTitles=dic.allValues;
    
}
-(void)initRightView
{
    
    [self makeOneCustomView:CGRectMake(5, 10, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
    [self makeOneCustomView:CGRectMake(5, SCREEN_HEIGHT/4-10, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
    [self makeOneCustomView:CGRectMake(5, SCREEN_HEIGHT/2-30, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
    [self makeOneCustomView:CGRectMake(5, SCREEN_HEIGHT/4*3-50, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
    
    [self makeOneCustomView:CGRectMake(SCREEN_WIDTH/2+5, 10, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
    [self makeOneCustomView:CGRectMake(SCREEN_WIDTH/2+5, SCREEN_HEIGHT/4-10, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
    [self makeOneCustomView:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-30, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
    [self makeOneCustomView:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/4*3-50, SCREEN_WIDTH/2, (SCREEN_HEIGHT-64)/4) AndImageName:@"cainixihuan.png" AndText:@"111"];
}
-(void)initTable
{
    UITableView * leftTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    leftTable.backgroundColor=[UIColor clearColor];
    leftTable.dataSource=self;
    leftTable.delegate=self;
    _search=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    _search.backgroundColor=[UIColor whiteColor];
    leftTable.tableHeaderView=_search;
    leftTable.tag=Left_TableView;
    [_scroller addSubview:leftTable];

}
#pragma make-ClickAndDelegate
-(void)backClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)segClick:(UISegmentedControl*)sender
{
    if (sender.selectedSegmentIndex==0) {
        NSLog(@"000");
        _scroller.contentOffset=CGPointMake(0, 0);
    }else{
        NSLog(@"111");
        _scroller.contentOffset=CGPointMake(SCREEN_WIDTH, 0);
    }
   
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cellName";
    
    
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        NSMutableArray * titleArr=[[NSMutableArray alloc] init];
        EngineInterface *engin=[[EngineInterface alloc] init];
        NSDictionary *dic=[[NSDictionary alloc]initWithDictionary:[engin readPlist]];
        titleArr=((NSMutableArray*)[dic valueForKey:[dic.allKeys objectAtIndex:indexPath.section]]);
        cell.textLabel.text=[titleArr objectAtIndex:indexPath.row];
        return cell;
        
    }
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    if (tableView.tag==Left_TableView) {
        return 22;
    }
    else{
        return 2;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

        EngineInterface *engin=[[EngineInterface alloc] init];
        NSDictionary *dic=[[NSDictionary alloc]initWithDictionary:[engin readPlist]];
        return ((NSArray*)[dic valueForKey:[dic.allKeys objectAtIndex:section]]).count;
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    EngineInterface *engin=[[EngineInterface alloc] init];
    NSDictionary *dic=[[NSDictionary alloc]initWithDictionary:[engin readPlist]];
    NSArray * keyArr=[[NSArray alloc] initWithArray:dic.allKeys];
    return [keyArr objectAtIndex:section];
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    EngineInterface *engin=[[EngineInterface alloc] init];
    NSDictionary *dic=[[NSDictionary alloc]initWithDictionary:[engin readPlist]];
    NSArray * keyArr=[[NSArray alloc] initWithArray:dic.allKeys];
    return keyArr;
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![_search isExclusiveTouch]) {
        [_search resignFirstResponder];
    }
}

#pragma make - Classes
-(void)makeOneCustomView:(CGRect)frame AndImageName:(NSString *)name AndText:(NSString *)text;
{
    UIImageView * imageView=[[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width-10, frame.size.height-40)];
    imageView.backgroundColor=[UIColor blackColor];
    imageView.image=[UIImage imageNamed:name];
    [_rightView addSubview:imageView];
    UILabel * lable=[[UILabel alloc] initWithFrame:CGRectMake(frame.origin.x,CGRectGetMaxY(imageView.frame) ,imageView.frame.size.width, 30)] ;
    lable.text=text;
    lable.backgroundColor=[UIColor blueColor];
    lable.textAlignment=NSTextAlignmentCenter;
    [_rightView addSubview:lable];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth=scrollView.frame.size.width;
    int i=(int)(floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1);
    _seg.selectedSegmentIndex=i;
}


@end
