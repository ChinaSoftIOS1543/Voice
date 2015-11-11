//
//  HeaderView.m
//  SingPub
//
//  Created by 中软mini017 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "HeaderView.h"


#import "HeaderView.h"

@interface HeaderView(){
    UILabel *userLabel;
    UILabel *userIDlabel;
    
}

@end

@implementation HeaderView


-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, 104)];
    imageView.image = [UIImage imageNamed:@"myinfo_head_bg.jpg"];
    [self addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 60, 60)];
    imageView1.image = [UIImage imageNamed:@"default_avatar.png"];
    [imageView addSubview:imageView1];
    
    userLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView1.frame)+10, 35, 200, 20)];
    [imageView addSubview:userLabel];
    
    userIDlabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView1.frame)+10, 60, 200, 20)];
    [imageView addSubview:userIDlabel];
    
}

-(void)updataHeaderViewInfo{
    
    userLabel.text = _data.userName;
    userIDlabel.text = _data.userID;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
