//
//  MineTableViewCell.m
//  SingPub
//
//  Created by 中软mini017 on 15/11/9.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "MineTableViewCell.h"

@interface MineTableViewCell(){
    
    UIImageView *leftImage;
    UIImageView *rightImage;
    UILabel *leftLabel;
    UILabel *rightLabel;
    
}

@end

@implementation MineTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initLayout];
    }
    return self;
}

-(void)initLayout{
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 50)];
   // bgView.backgroundColor = [UIColor blueColor];
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.contentView addSubview:bgView];
    
    leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    [bgView addSubview:leftImage];
    
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame)+10, 10, 160, 30)];
    [bgView addSubview:leftLabel];
    
    rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-30, 10, 20, 20)];
    [bgView addSubview:rightImage];
    
    rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-CGRectGetMaxY(rightImage.frame)-160, 10, 160, 20)];
    [bgView addSubview:rightLabel];
    
}

-(void)updataMiewCellInfo{
    
    leftImage.image = [UIImage imageNamed:_data.leftImage];
    leftLabel.text = _data.leftLabel;
    rightImage.image = [UIImage imageNamed:_data.rightImage];
    rightLabel.text =_data.rightLabel;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
       
}

@end
