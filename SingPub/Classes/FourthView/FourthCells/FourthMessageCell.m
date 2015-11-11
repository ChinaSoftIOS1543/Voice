//
//  FourthMessageCell.m
//  SingPub
//
//  Created by 中软mini007 on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FourthMessageCell.h"

@interface FourthMessageCell (){
    UIImageView* _imageView;
    UILabel* _title1;
    UILabel* _title2;
    UILabel* _title3;
}

@end


@implementation FourthMessageCell

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
    
    
    _title1 = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.size.width+10, bgView.frame.size.height/2-24, SCREEN_WIDTH-160, 18)];
    
    _title1.backgroundColor = [UIColor redColor];
    
    _title1.font = [UIFont systemFontOfSize:15];
    
    [bgView addSubview:_title1];
    
    _title2 = [[UILabel alloc] initWithFrame:CGRectMake(_imageView.frame.size.width+10, _title1.frame.size.height+20, SCREEN_WIDTH, 14)];
    _title2.backgroundColor = [UIColor redColor];
    
    _title2.font = [UIFont systemFontOfSize:10];
    
    [bgView addSubview:_title2];
    
    _title3 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, 10, 30, 20)];
    _title3.backgroundColor = [UIColor redColor];
    _title3.font = [UIFont systemFontOfSize:9];
    
    [bgView addSubview:_title3];
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    
    line.backgroundColor = [UIColor colorWithRed:194/255.0f green:194/255.0f blue:194/255.0f alpha:1.0];
    
    [bgView addSubview:line];
    
}

-(void)updateMessageCell{
    _imageView.image = [UIImage imageNamed:_data.imageName];
    _title1.text = _data.title1Name;
    _title2.text = _data.title2Name;
    _title3.text = _data.title3Name;
    
}


@end
