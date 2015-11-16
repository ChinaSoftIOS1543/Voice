//
//  ThirdScrollerView.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdScrollerView.h"

#define Image_Count 5
#define Image_Height 130


@interface ThirdScrollerView ()<UIScrollViewDelegate>
{
    UIScrollView * _scrollerView;
    
    CGFloat _imageHeight;
    
    UIImageView * _imageView;
    
    UIPageControl * _pageControll;
    
    NSTimer * _timer;
    
    
}

@property(nonatomic,assign)HWScrollViewType type;

@property(nonatomic,strong)NSArray * imageArrays;

@end

@implementation ThirdScrollerView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        
    }
    
    return self;
}

+(id)showScrollerView:(HWScrollViewType)type ImageArray:(NSArray *)image
{
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    ThirdScrollerView * newScollerView = [[ThirdScrollerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    newScollerView.type = type;
    
    newScollerView.imageArrays = image;
    
    [newScollerView showUI];
    
    return newScollerView;
    
}

-(void)showUI
{
    [self initUI];
    
    [self initScrollerViewWithImage];
    
    [self initPageControll];
    
    [self initTimer];
}

-(void)initUI
{
    _scrollerView = [[UIScrollView alloc] init];
    
    if (_type == HWScrollViewTypeBanner)
    {
        _imageHeight = Image_Height;
        
        _scrollerView.frame = CGRectMake(0,-65, SCREEN_WIDTH, Image_Height);
        
    }else
    {
        _imageHeight = SCREEN_HEIGHT;
        
        _scrollerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    
    _scrollerView.delegate = self;
    
    _scrollerView.pagingEnabled  = YES;
    
    _scrollerView.bounces = NO;
    
    _scrollerView.showsHorizontalScrollIndicator = NO;
    
    _scrollerView.showsVerticalScrollIndicator = NO;
    
    _scrollerView.contentOffset = CGPointZero;
    
    [self addSubview:_scrollerView];
}

-(void)initScrollerViewWithImage
{
    _scrollerView.contentSize = CGSizeMake(SCREEN_WIDTH*[_imageArrays count], _imageHeight);
    
    for (int index = 0; index < [_imageArrays count]; index++)
    {
        NSString * name = [_imageArrays objectAtIndex:index];
        
        UIImage * image = [UIImage imageNamed:name];
        
        _imageView = [[UIImageView alloc] initWithImage:image];
        
        _imageView.frame = CGRectMake(index*SCREEN_WIDTH, 0, SCREEN_WIDTH, _imageHeight);
        
        _imageView.userInteractionEnabled = YES;
        
        if (_type == HWScrollViewTypeBanner)
        {
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ImageClicked:)];
            
            _imageView.userInteractionEnabled = YES;
            
            [_imageView addGestureRecognizer:tap];
        }else
        {
            
            
        }
        
         [_scrollerView addSubview:_imageView];
    }
    
   
}

-(void)ImageClicked:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(newScrollerViewImageViewWithIndex:)])
    {
        UITapGestureRecognizer * tap = (UITapGestureRecognizer *)sender;
        
        UIImageView * currectImageView = (UIImageView *)tap.view;
        
        [_delegate newScrollerViewImageViewWithIndex:currectImageView.tag];
    }
}


-(void)initPageControll
{
    if (_type == HWScrollViewTypeBanner)
    {
        _pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100/2, _imageHeight-30, 100, 44)];
        
        _pageControll.numberOfPages = [_imageArrays count];
        
        _pageControll.currentPage = 0;
        
        _pageControll.pageIndicatorTintColor = [UIColor grayColor];
        
        _pageControll.currentPageIndicatorTintColor = [UIColor greenColor];
    }else
    {
        _pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100/2, _imageHeight-88, 100, 44)];
        
        _pageControll.numberOfPages = [_imageArrays count];
        
        _pageControll.currentPage = 0;
        
        //小圆点的底色
        _pageControll.pageIndicatorTintColor = [UIColor grayColor];
        
        //当前小圆点的颜色
        _pageControll.currentPageIndicatorTintColor = [UIColor whiteColor];

    }
    
    [_scrollerView addSubview:_pageControll];
}


//scrollView的代理，实现多个页面都显示Pagecontrol(如果不写代理，则只在第一个界面显示）
#pragma mark- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int page = (int)floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    
    if (_type == HWScrollViewTypeBanner)
    {
        _pageControll.frame = CGRectMake(SCREEN_WIDTH*page+SCREEN_WIDTH/2-100/2,Image_Height-30, 100,44);
        
        _pageControll.currentPage = page;
        
    }else
    {
        _pageControll.frame = CGRectMake(SCREEN_WIDTH*page+SCREEN_WIDTH/2-100/2, SCREEN_HEIGHT-88, 100,44 );
        
        _pageControll.currentPage = page;
    }
}

-(void)initTimer
{
    if (_type == HWScrollViewTypeBanner)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        
        self.frame = CGRectMake(0, 64,SCREEN_WIDTH, Image_Height);
    }else
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        
        self.frame = CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT);
    }
}

-(void)nextPage
{
    if (_pageControll.numberOfPages>1)
    {
        _pageControll.currentPage = (_pageControll.currentPage+1)%_pageControll.numberOfPages;
        
        [_scrollerView setContentOffset:CGPointMake(_pageControll.currentPage*_scrollerView.bounds.size.width, 0) animated:YES];
    }

}
@end
