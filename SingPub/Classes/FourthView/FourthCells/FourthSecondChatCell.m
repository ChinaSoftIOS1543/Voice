//
//  FourthSecondChatCell.m
//  SingPub
//
//  Created by 中软mini007 on 15/11/13.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FourthSecondChatCell.h"

@interface FourthSecondChatCell (){
    UIImageView* _imageView;
    UILabel* _title;
}

@end



@implementation FourthSecondChatCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,64)];
    
    //bgView.backgroundColor = [UIColor greenColor];
    
    [self.contentView addSubview:bgView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,  5, 54, 54)];
    _imageView.backgroundColor = [UIColor blackColor];
    
    [bgView addSubview:_imageView];
    
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.size.width+10, bgView.frame.size.height/2-9, SCREEN_WIDTH-160, 18)];
    
    _title.backgroundColor = [UIColor redColor];
    
    _title.font = [UIFont systemFontOfSize:15];
    
    [bgView addSubview:_title];
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    
    line.backgroundColor = [UIColor colorWithRed:194/255.0f green:194/255.0f blue:194/255.0f alpha:1.0];
    
    [bgView addSubview:line];
    
}

-(void)updateChatCell{
    _imageView.image = [UIImage imageNamed:_data.imageName];
    _title.text = _data.titleName;
}

@end
