//
//  SecCustomImageView.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecCustomImageView.h"


@interface SecCustomImageView ()
{
    UIImageView* _imageView;
    UILabel * _label;
}


@end

@implementation SecCustomImageView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI
{
     _imageView=[[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/5-40)/2, 15, 40, 40)];
    
    //
    _imageView.backgroundColor=[UIColor clearColor];
    //_imageView.image=[UIImage imageNamed:@"cainixihuan.png"];
    _imageView.userInteractionEnabled=YES;
    
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [_imageView addGestureRecognizer:tap];
    [self addSubview:_imageView];
    
    _label=[[UILabel alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH/5, 15)];
    _label.textAlignment=NSTextAlignmentCenter;
    //
   
    _label.font=[UIFont systemFontOfSize:12];
    _label.backgroundColor=[UIColor clearColor];
    [self addSubview:_label];

}

-(void)imageViewClick:(id)sender
{
    [self.delegate ImageViewDelegateClick:sender];
}
-(void)updateImage
{
    _imageView.image=[UIImage imageNamed:_data.dataImage];
    _label.text=_data.dataName;
    _imageView.tag = self.imageTag;
}


















@end
