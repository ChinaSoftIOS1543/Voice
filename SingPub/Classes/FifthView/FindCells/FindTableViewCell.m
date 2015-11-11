//
//  FindTableViewCell.m
//  ChangBaProject
//
//  Created by apple on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FindTableViewCell.h"

@interface FindTableViewCell(){
    UIImageView *_ltImageView;
    UIImageView *_rtimageView;
    UILabel *_ltTitle;
    UILabel *_rtTitle;
}

@end

@implementation FindTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI1];
    }
    return self;
}

-(void)initUI1{
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgview];
    
    _ltImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12.5, 12.5, 20, 20)];
    _ltImageView.backgroundColor = [UIColor clearColor];
    [bgview addSubview:_ltImageView];
    
    _rtimageView  = [[UIImageView alloc] init];
    _rtimageView.backgroundColor = [UIColor clearColor];
    _rtimageView.frame = CGRectMake(SCREEN_WIDTH-20, 16.5, 12, 12);
    [bgview addSubview:_rtimageView];
    
    _ltTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_ltImageView.frame)+10, bgview.frame.size.height/2-20/2, 150, 20)];
    
    //测试位置，应为clear
    _ltTitle.backgroundColor = [UIColor clearColor];
    _ltTitle.font = [UIFont systemFontOfSize:14];
    [bgview addSubview:_ltTitle];
    //cell之间分割线
    UIView *downLine = [[UIView alloc] initWithFrame:CGRectMake(0, 44.5, SCREEN_WIDTH, 0.5)];
    downLine.backgroundColor = [UIColor colorWithRed:194/255.0f green:194/255.0f blue:194/255.0f alpha:1.0f];
    [bgview addSubview:downLine];
    
    
}
-(void)updateFindCell{
    _ltImageView.image = [UIImage imageNamed:_data.ltIcon];
    _ltTitle.text = _data.ltTitle;
    _rtimageView.image = [UIImage imageNamed:_data.rtIcon];
    _rtTitle.text = _data.rtTitle;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
