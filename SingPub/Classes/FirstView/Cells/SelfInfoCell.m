//
//  SelfInfoCell.m
//  SingPub
//
//  Created by 中软mini017 on 15/11/5.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SelfInfoCell.h"

@interface SelfInfoCell(){
    
    UIImageView *leftImage;
    UILabel *leftLabel;
    UIImageView *rightImage;
    UILabel *rightLabel;
}

@end

@implementation SelfInfoCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)initUI{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, self.frame.size.height)];
   leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
    [view addSubview:leftImage];
    
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame)+5, 0, 100, self.frame.size.height)];
    [view addSubview:leftLabel];
    
    rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-20, 0, 10, self.frame.size.height)];
    [view addSubview:rightImage];
    
    rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3*2, 0, SCREEN_WIDTH/3, self.frame.size.height)];
    [view addSubview:rightLabel];
}

-(void)updataSelfInfoCellData{
    
    leftLabel.text = _data.leftLabel;
    leftImage.image = [UIImage imageNamed:_data.leftImage];
    rightLabel.text = _data.rightLabel;
    rightImage.image = [UIImage imageNamed:_data.rightImage];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
