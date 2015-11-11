//
//  FithBannerView.m
//  SingPub
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithBannerView.h"
#define Image_Count 4
#define Image_Hegiht 130

@interface FithBannerView()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_page;
    NSTimer *_timer;
    NSArray *imageArrays;
    CGFloat _imageHeight;
    
}

@end

@implementation FithBannerView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self showUI];
    }
    return self;
}

-(void)showUI{
    [self initUI];
    [self initScrollViewWithImage];
    [self initPageControll];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    self.frame = CGRectMake(0, 64, SCREEN_WIDTH, Image_Hegiht);
}

-(BOOL)nextPage{
    if (_page.numberOfPages > 1) {
        _page.currentPage = (_page.currentPage +1 )%_page.numberOfPages;
        
        [_scrollView setContentOffset:CGPointMake(_page.currentPage * _scrollView.bounds.size.width, 0) animated:YES];
    }
    return YES;
}
+(id)showBannerWithImageArr:(NSArray *)images{
    [UIApplication sharedApplication].statusBarHidden = YES;
    FithBannerView *view = [[FithBannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.imageArrys = images;
    [view showUI];
    return view;
}

-(void)initPageControll{
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100/2, _imageHeight-25, 100, 25)];
    //_page = [[UIPageControl alloc] init];
    
    _page.numberOfPages = [_imageArrys count];
    _page.currentPage = 0;
    
    _page.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    _page.pageIndicatorTintColor = [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:0.4f];
    [_scrollView addSubview:_page];
}

-(void)initScrollViewWithImage{
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * [_imageArrys count], _imageHeight);
    for (int index = 0; index < [_imageArrys count]; index++) {
        NSString *imageName = [_imageArrys objectAtIndex:index];
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(index*SCREEN_WIDTH, 0, SCREEN_WIDTH, _imageHeight);
        imageView.tag = index;
        [_scrollView addSubview:imageView];
    }
    
}

-(void)initUI{
    _scrollView = [[UIScrollView alloc] init];
    _imageHeight = Image_Hegiht;
    _scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _imageHeight);
    
    _scrollView.delegate = self;
    _scrollView.contentOffset = CGPointZero;
    _scrollView.bounces = YES;
    
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    [self addSubview:_scrollView];
}

#pragma mark - scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = (int)(floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1);
    _page.frame = CGRectMake(SCREEN_WIDTH*page+SCREEN_WIDTH/2-100/2, Image_Hegiht-30, 100, 30);
    _page.currentPage = page;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
