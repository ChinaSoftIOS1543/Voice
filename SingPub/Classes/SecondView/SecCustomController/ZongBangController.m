//
//  ZongBangController.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ZongBangController.h"
#import "HeaderView.h"



@interface ZongBangController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UISegmentedControl * seg;
@property(nonatomic,strong)UIScrollView *scroller;
@end

@implementation ZongBangController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initUI];
}
-(void)viewWillDisappear:(BOOL)animated
{
    _seg.hidden=YES;
}
-(void)initUI
{
    //分段控制器初始化
    NSArray * arr=[[NSArray alloc] initWithObjects:@"作品榜",@"歌手榜",@"财富榜", nil];
    _seg=[[UISegmentedControl alloc] initWithItems:arr];
    _seg.selectedSegmentIndex=0;
    _seg.frame=CGRectMake(SCREEN_WIDTH/4, 10, SCREEN_WIDTH/2, 30);
    _seg.tintColor=[UIColor grayColor];
    _seg.backgroundColor=[UIColor whiteColor];
    [_seg  addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];

    [self.navigationController.navigationBar addSubview:_seg];
    
    //scrollView初始化
    _scroller=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    _scroller.contentSize=CGSizeMake(SCREEN_WIDTH*3, SCREEN_WIDTH-64);
    _scroller.backgroundColor=[UIColor blueColor];
    _scroller.pagingEnabled=YES;
    _scroller.delegate=self;
    UILabel * lable1=[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH+60, 100, 200, 200)];
    lable1.backgroundColor=[UIColor redColor];
    [_scroller addSubview:lable1];
    [self.view addSubview:_scroller];
    [self initCollentionView];
   
}

-(void)initCollentionView
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setHeaderReferenceSize:CGSizeMake(320, 50)];
    
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    collectionView.dataSource=self;
    collectionView.delegate=self;
    [collectionView setBackgroundColor:[UIColor clearColor]];
    
    //注册Cell，必须要有
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [_scroller addSubview:collectionView];
}

#pragma mark - delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth=scrollView.frame.size.width;
    int i=(int)(floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1);
    _seg.selectedSegmentIndex=i;
}
-(void)segClick:(UISegmentedControl *)sender
{
    _scroller.contentOffset=CGPointMake(sender.selectedSegmentIndex *SCREEN_WIDTH, 0);
}



#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger  count = 0;
    switch (section) {
        case 0:
        {
            count=2;
        }
            break;
        case 1:
        {
            count=6;
        }
            break;
        case 2:
        {
            count=7;
        }
            break;
    }
    return count;
    
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor blackColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    UIImageView * imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.backgroundColor=[UIColor redColor];
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell.contentView addSubview:label];
    [cell.contentView addSubview:imageView];
    return cell;
}

#pragma make - CollectionViewDelegate

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/2-10, 100);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //方位
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    HeaderView * headView=[[HeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
//    headView.backgroundColor=[UIColor orangeColor];
//    
//    return headView;
//}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    cell.backgroundColor = [UIColor greenColor];
    NSLog(@"item======%ld",(long)indexPath.item);
    NSLog(@"row=======%ld",(long)indexPath.row);
    NSLog(@"section===%ld",(long)indexPath.section);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
