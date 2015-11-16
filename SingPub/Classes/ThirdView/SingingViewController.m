//
//  SingingViewController.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "SingingViewController.h"
#import "RecordingViewController.h"
#import "ThirdRequestSongView.h"
#import "ThirdAccomplishSongView.h"
#import "ThirdLocalRecordedView.h"
#import "SearchView.h"
#import "ThirdScrollerView.h"



#define pages 3
#define pageNameArray @[@"点歌台",@"已点歌曲",@"本地录音"]

@interface SingingViewController ()<UISearchBarDelegate,UIScrollViewDelegate>
{
    UISearchBar * _searchBar;
    
    UIView * _topView;
    
    UIView * _redLineView;
    
    UISegmentedControl * _seg;
    
}
@property(nonatomic,strong) SearchView * searchView;

@property UIScrollView * scrollView;

@property(nonatomic,strong)ThirdRequestSongView* requestSongView;

@property(nonatomic,strong)ThirdAccomplishSongView * accomplishSongView;

@property(nonatomic,strong)ThirdLocalRecordedView * localRecordedView;


@end

@implementation SingingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view;
    
    [self initUI];
    
    [self initScrollView];
    
    [self initSubView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self navigationBar];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_searchBar removeFromSuperview];
    
    _searchBar = nil;
}
-(void)navigationBar
{
    UIImage * image = [[UIImage imageNamed:@"ThirdMac@2x.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(LeftBtn:)];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, 7, 200, 30)];
    
    _searchBar.tintColor = [UIColor grayColor];
    
    _searchBar.placeholder = @"歌曲名、歌手名、首字母";
    
    _searchBar.delegate = self;
    
    _searchBar.keyboardType =  UIKeyboardTypeNamePhonePad;
    
    //当选中searchBar的时候,键盘最下方的类型
    [_searchBar setReturnKeyType:UIReturnKeySearch];
    
    //是否在控件的右端显示搜索结果按钮（在没有文字的时候）
    _searchBar.showsSearchResultsButton = NO;
    
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    
    [self.navigationController.navigationBar addSubview:_searchBar];

}

-(void)LeftBtn:(id)sender
{
    RecordingViewController * record = [[RecordingViewController alloc] init];
    
    [self.navigationController pushViewController:record animated:YES];
    
}

#pragma mark- UISearchBarDelegate

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    _searchView= [[SearchView alloc] init];
    
    _searchView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    [self.view.superview addSubview:_searchView];
    
    
    _searchBar.frame = CGRectMake(10, 7, 310, 30);
    
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    
    NSLog(@"ShouldBeginEditing");
    return YES;
}

//点击searchbar开始编辑时UISearchBar的textView时调用此函数
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    _searchBar.showsCancelButton = YES;
    
    for (id cc in [searchBar.subviews[0] subviews])
    {
        if ([cc isKindOfClass:[UIButton class]])
        {
            UIButton * btn = (UIButton *)cc;
            [btn setTitle:@"取消" forState:UIControlStateNormal];
            
        }
    }

    NSLog(@"DidBeginEditing");

}

//当textView的文字改变或清除的时候调用此方法，搜索栏目前的状态正在编辑，在搜索文本字段中的当前文本
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"%@",searchText);
}

//点击search的时候调用
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"search");
}


//点击CancelButton时的事件
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    
    [_searchView removeFromSuperview];
    
    _searchView = nil;

     _searchBar.showsCancelButton = NO;
    
    _searchBar.frame = CGRectMake(SCREEN_WIDTH/2-100, 7, 200, 30);
}


-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"EndEditing");
    return YES;
}
//当编辑完成之后调用此函数
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"didenediting");
}


#pragma mark- UIView
-(void)initUI
{
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
    _topView.backgroundColor = [UIColor whiteColor];
    
    _seg = [[UISegmentedControl alloc] initWithItems:pageNameArray];
    
    _seg.selectedSegmentIndex = 0;
    
    _seg.frame = CGRectMake(0,0, SCREEN_WIDTH, 40);
    
    _seg.tintColor = [UIColor clearColor];
    
    [_seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    
    //选中字体变大，变色
    [_seg setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateSelected];
    
    [_topView addSubview:_seg];
    
    _redLineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_seg.frame), 40-3, _seg.frame.size.width/_seg.numberOfSegments,3 )];
    
    _redLineView.backgroundColor = [UIColor orangeColor];
    
    [_topView addSubview:_redLineView];

    
    [self.view addSubview:_topView];
}

-(void)initScrollView
{
    [_seg addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
    
    //初始化滚动视图
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT-104)];
    
    [self.view addSubview:_scrollView];
    
    _scrollView.contentSize=CGSizeMake(SCREEN_WIDTH*pages, 0);
    
    _scrollView.pagingEnabled=YES;
    
    _scrollView.showsHorizontalScrollIndicator=NO;
    
    _scrollView.delegate=self;
    
}

-(void)valueChange
{
    int index = (int)_seg.selectedSegmentIndex;
    
    [UIView animateWithDuration:0.2 animations:^{
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
        
        _redLineView.center = CGPointMake(CGRectGetMinX(_seg.frame)+((_seg.frame.size.width)/_seg.numberOfSegments)*index+_seg.frame.size.width/(_seg.numberOfSegments*2),_redLineView.center.y );
        
    }];
}

-(void)initSubView
{
    _requestSongView = [[ThirdRequestSongView alloc] init];
    _accomplishSongView = [[ThirdAccomplishSongView alloc] init];
    _localRecordedView = [[ThirdLocalRecordedView alloc] init];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    
    [arr addObject:self.requestSongView];
    [arr addObject:self.accomplishSongView];
    [arr addObject:self.localRecordedView];
    
    
    for (UIView * v in arr)
    {
        v.frame = CGRectMake(SCREEN_WIDTH*[arr indexOfObject:v], 0, SCREEN_WIDTH, SCREEN_HEIGHT-104);
        
        [_scrollView addSubview:v];
    }
    
    
    
}

//ScrollView的代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float index = scrollView.contentOffset.x/SCREEN_WIDTH;
    
    _seg.selectedSegmentIndex = index;
    
    _redLineView.center = CGPointMake(CGRectGetMinX(_seg.frame)+ ((_seg.frame.size.width)/_seg.numberOfSegments)*index+_seg.frame.size.width/(_seg.numberOfSegments*2), _redLineView.center.y);
}


@end
