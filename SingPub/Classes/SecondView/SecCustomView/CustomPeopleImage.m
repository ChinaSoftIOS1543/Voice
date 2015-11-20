//
//  CustomPeopleImage.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "CustomPeopleImage.h"
#import "EGOImageView.h"
#import "EGOCache.h"

@interface CustomPeopleImage ()
{
    NSArray * imgURLs;
    EGOImageView *egoImageView;
}

@end

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
    
    egoImageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"Default-568h.png"]];
    egoImageView.frame=CGRectMake(0, 0,frame.size.width, frame.size.height);
        [self addSubview:egoImageView];
    UILabel * label=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(egoImageView.frame)-40, SCREEN_WIDTH/3 , 20)];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"用户id";
    label.font=[UIFont systemFontOfSize:12];
    [self addSubview:label];
    
    UILabel * label2=[[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(egoImageView.frame)-20, SCREEN_WIDTH/3 , 20)];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"歌名";
    label2.font=[UIFont systemFontOfSize:12];
    [self addSubview:label2];

}
-(void)imageViewClick:(id)sender
{
    [self.delegate CustomPeopleClick:sender];
}

-(void)setImageWithURL:(NSString *)imageURL
{
    [egoImageView setImageURL:[NSURL URLWithString:imageURL]];
    
}

@end
