//
//  SecCustomCell.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecCustomCell.h"
#import "CustomPeopleImage.h"

@implementation SecCustomCell

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
-(void)initUI{
    CustomPeopleImage * imageView1=[[CustomPeopleImage alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3-1, 100)];
    imageView1.backgroundColor=[UIColor orangeColor];
    [self.contentView addSubview:imageView1];
    
    CustomPeopleImage * imageView2=[[CustomPeopleImage alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3-1, 100)];
    imageView2.backgroundColor=[UIColor orangeColor];
    [self.contentView  addSubview:imageView2];
    
    CustomPeopleImage * imageView3=[[CustomPeopleImage alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3*2,0, SCREEN_WIDTH/3, 100)];
    imageView3.backgroundColor=[UIColor orangeColor];
    [self.contentView  addSubview:imageView3];
}
@end
