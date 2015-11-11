//
//  CustomPeopleImage.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "CustomPeopleImage.h"

@implementation CustomPeopleImage



-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self initUI:frame];
    }
    return self;
}
-(void)initUI:(CGRect)frame
{
    UIImageView* imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height)];
    //
    imageView.backgroundColor=[UIColor blueColor];
    imageView.image=[UIImage imageNamed:@"board_hotduet.png"];
    imageView.userInteractionEnabled=YES;
    imageView.tag=self.tag;
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [imageView addGestureRecognizer:tap];
    [self addSubview:imageView];
    
    UILabel * label=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)-40, SCREEN_WIDTH/3 , 20)];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"用户id";
    label.font=[UIFont systemFontOfSize:12];
    [self addSubview:label];
    
    UILabel * label2=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)-20, SCREEN_WIDTH/3 , 20)];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"歌名";
    label2.font=[UIFont systemFontOfSize:12];
    [self addSubview:label2];
}
-(void)imageViewClick:(id)sender
{
    [self.delegate CustomPeopleClick:sender];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
