//
//  SecCustomHeChangCell.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/14.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecCustomHeChangCell.h"


@implementation SecCustomHeChangCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}



-(void)initUI
{
    
    UILabel * nameLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 15)];
    nameLable.backgroundColor=[UIColor blackColor];
    nameLable.textAlignment=NSTextAlignmentCenter;
    [self.contentView addSubview:nameLable];
    
    UIImageView * leftView=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4-20, 30, 40, 40)];
    leftView.backgroundColor=[UIColor redColor];
    leftView.image=[UIImage imageNamed:@""];
    [self.contentView addSubview:leftView];
    
    UIImageView * rightView=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4*3-20, 30, 40, 40)];
    rightView.backgroundColor=[UIColor redColor];
    rightView.image=[UIImage imageNamed:@""];
    [self.contentView addSubview:rightView];
    
    UILabel * leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 75, SCREEN_WIDTH/2-10, 10)];
    leftLabel.backgroundColor=[UIColor blackColor];
    leftLabel.textAlignment=NSTextAlignmentCenter;
    [self.contentView addSubview:leftLabel];
    
    UILabel * rightLable=[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+10, 75, SCREEN_WIDTH/2-20, 10)];
    rightLable.backgroundColor=[UIColor blackColor];
    rightLable.textAlignment=NSTextAlignmentCenter;
    [self.contentView addSubview:rightLable];
    
    
    UILabel *text=[[UILabel alloc] init];
    [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    text.numberOfLines=0;
    text.textAlignment=NSTextAlignmentLeft;
    text.preferredMaxLayoutWidth=SCREEN_WIDTH-10;
    text.text=@"546546546546546546564654646545465465465465465465646546465";
    text.backgroundColor=[UIColor redColor];
    
    [self.contentView addSubview:text];
    [text setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.contentView addConstraint:[NSLayoutConstraint
                                     constraintWithItem:text
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeLeft
                                     multiplier:1 constant:10]];
    
    [self.contentView addConstraint:[NSLayoutConstraint
                                     constraintWithItem:text
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.contentView
                                     attribute:NSLayoutAttributeTop
                                     multiplier:1 constant:90]];
    
    [self.contentView addConstraint:[NSLayoutConstraint
                                     constraintWithItem:self.contentView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:text
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1 constant:10]];
    
    
    
}

@end
