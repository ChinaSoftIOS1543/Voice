//
//  ThirdSingingHeaderView.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdSingingHeaderView.h"
#import "ThirdScrollerView.h"


@interface ThirdSingingHeaderView ()
{
    UIView * _headerView;
    
    UIButton * _button1;
    
    UIButton * _button2;
    
    UIButton * _button3;
    
    UIButton * _button4;
    
    UILabel * _label1;
    
    UILabel * _label2;
    
    UILabel * _label3;
    
    UILabel * _label4;
}

@end

@implementation ThirdSingingHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initHeaderView];
    }
    
    return self;
}

-(void)initHeaderView
{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 210)];
    
    _headerView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_headerView];
    
    NSMutableArray * _imageArray = [[NSMutableArray alloc] init];
    
    for (int index = 1;index <7 ; index++)
    {
        NSString * imageName = [[NSString alloc] initWithFormat:@"TH_Banner%d.png",index];
        
        [_imageArray addObject:imageName];
    }
    
    ThirdScrollerView * bannerView = [ThirdScrollerView showScrollerView:HWScrollViewTypeBanner ImageArray:_imageArray];
    
    [_headerView addSubview:bannerView];
    
    _button1 = [self addUIButtonWithRect:CGRectMake(20, 140, SCREEN_WIDTH/8+5, SCREEN_WIDTH/8+5) Tag:Request_Button];
    
    [_headerView addSubview:_button1];
    
    _button2 = [self addUIButtonWithRect:CGRectMake(CGRectGetMaxX(_button1.frame)+100/3, 140, SCREEN_WIDTH/8+5, SCREEN_WIDTH/8+5) Tag:Classify_Button];
    [_headerView addSubview:_button2];
    
    _button3 = [self addUIButtonWithRect:CGRectMake(CGRectGetMaxX(_button2.frame)+100/3, 140, SCREEN_WIDTH/8+5, SCREEN_WIDTH/8+5) Tag:Wonderful_Button];
    
    [_headerView addSubview:_button3];
    
    _button4 = [self addUIButtonWithRect:CGRectMake(CGRectGetMaxX(_button3.frame)+100/3, 140, SCREEN_WIDTH/8+5, SCREEN_WIDTH/8+5) Tag:SingSong_Button];
    [_headerView addSubview:_button4];
    
    _label1 = [self addUILabelWithRect:CGRectMake(12, CGRectGetMaxY(_button1.frame)+3, SCREEN_WIDTH/4-20, 20)];
    [_headerView addSubview:_label1];
    
    _label2 = [self addUILabelWithRect:CGRectMake(CGRectGetMaxX(_label1.frame)+17, CGRectGetMaxY(_button1.frame)+3, SCREEN_WIDTH/4-20, 20)];
    [_headerView addSubview:_label2];

    _label3 = [self addUILabelWithRect:CGRectMake(CGRectGetMaxX(_label2.frame)+19, CGRectGetMaxY(_button1.frame)+3, SCREEN_WIDTH/4-20, 20)];
    [_headerView addSubview:_label3];

    _label4 = [self addUILabelWithRect:CGRectMake(CGRectGetMaxX(_label3.frame)+17, CGRectGetMaxY(_button1.frame)+3, SCREEN_WIDTH/4-20, 20)];
    [_headerView addSubview:_label4];
}

-(UIButton *)addUIButtonWithRect:(CGRect)rect Tag:(CGFloat)tag
{
    UIButton * butt = [[UIButton alloc] initWithFrame:rect];
    
    butt.backgroundColor = [UIColor clearColor];
    
    butt.tag = tag;
    
    [butt addTarget:self action:@selector(buttClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return butt;
}

-(UILabel *)addUILabelWithRect:(CGRect)rect
{
    UILabel * lab = [[UILabel alloc] initWithFrame:rect];
    
    lab.tintColor = [UIColor blackColor];
    
    lab.font = [UIFont systemFontOfSize:13.0f];
    
    lab.textAlignment =  NSTextAlignmentCenter;
    
    lab.backgroundColor = [UIColor clearColor];
    
    return lab;
}

-(void)buttClicked:(id)sender
{
   if(_delegate && [_delegate respondsToSelector:@selector(logoSingingHeaderViewClicked:)])
   {
        [_delegate logoSingingHeaderViewClicked:sender];
   }
}



-(void)updateSingingHeaderView
{
    [_button1 setImage:[UIImage imageNamed:_headerData._button1Name] forState:UIControlStateNormal];
    
    [_button2 setImage:[UIImage imageNamed:_headerData._button2Name] forState:UIControlStateNormal];
    
    [_button3 setImage:[UIImage imageNamed:_headerData._button3Name] forState:UIControlStateNormal];
    
    [_button4 setImage:[UIImage imageNamed:_headerData._button4Name] forState:UIControlStateNormal];
    
    _label1.text = _headerData._label1Name;
    
    _label2.text = _headerData._label2Name;
    
    _label3.text = _headerData._label3Name;
    
    _label4.text = _headerData._label4Name;
}
























@end
