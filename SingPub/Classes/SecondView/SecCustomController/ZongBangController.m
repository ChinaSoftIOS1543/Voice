//
//  ZongBangController.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ZongBangController.h"
#import "HeaderView.h"

@interface ZongBangController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
   
}

@property(nonatomic,strong)UISegmentedControl * seg;
@property(nonatomic,copy)NSMutableArray *arr;
@property(nonatomic,strong)UICollectionView * collectionView;

@end

@implementation ZongBangController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
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
    
    [self initCollentionView];
   
}

-(void)initCollentionView
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    //[flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置headView的尺寸 没有设置显示不出来
    [flowLayout setHeaderReferenceSize:CGSizeMake(SCREEN_WIDTH, 20)];
        self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:flowLayout];
         self.collectionView.dataSource=self;
         self.collectionView.delegate=self;
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        //注册Cell，必须要有
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        //注册headView，有headView必须有注册
        [ self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        [self.view addSubview: self.collectionView];
    
}

#pragma mark - delegate

-(void)segClick:(UISegmentedControl *)sender
{
    //传入数据
    [self.collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     NSInteger  count = 0;
        switch (section) {
            case 0:
            {
                count=3;
            }
                break;
            case 1:
            {
                count=5;
            }
                break;
            case 2:
            {
                count=2;
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


//设置headView的回调函数
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        reusableview.backgroundColor = [UIColor redColor];
        
    }
    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    view.backgroundColor=[UIColor orangeColor];
    [reusableview addSubview:view];
    return reusableview;
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    cell.backgroundColor = [UIColor greenColor];
    NSLog(@"%ld",(long)collectionView.tag);
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
