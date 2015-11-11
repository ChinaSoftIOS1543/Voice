//
//  DongTingCusotomCell.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "DongTingCusotomCell.h"

@implementation DongTingCusotomCell

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
    UIImageView * imageView=[[UIImageView alloc] init];
    imageView.backgroundColor=[UIColor blueColor];
    imageView.image=[UIImage imageNamed:@"Kgexiu.png"];
    [self.contentView addSubview:imageView];
    
   [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40]];
     [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1 constant:10]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imageView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1 constant:10]];
    
    UILabel * userName=[[UILabel alloc] initWithFrame:CGRectMake(60, 10, 150, 10)];
    userName.backgroundColor=[UIColor blackColor];
    [self addSubview:userName];

    UILabel * songName=[[UILabel alloc] initWithFrame:CGRectMake(60, 25, 200, 15)];
    songName.backgroundColor=[UIColor blackColor];
    [self addSubview:songName];
    
    
    
    UILabel *text=[[UILabel alloc] init];
    [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    text.numberOfLines=0;
    text.textAlignment=NSTextAlignmentLeft;
    text.preferredMaxLayoutWidth=SCREEN_WIDTH-10;
    text.text=@"546546546546546546564654646546546554654654655465465465465465465646546465465465546546546554654654654654654656465464654654655465465465546546546546546546564654646546546554654654655465465465465465465646546465465465546546546554654654654654654656465464654654655465465465";
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
                                     toItem:imageView
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1 constant:10]];
    
    [self.contentView addConstraint:[NSLayoutConstraint
                                     constraintWithItem:self.contentView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:text
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1 constant:10]];
    
    
    
    
//   [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:text attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:10]];
    
    
}
@end
