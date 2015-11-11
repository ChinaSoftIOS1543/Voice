//
//  FithVipTableViewCell.m
//  SingPub
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithVipTableViewCell.h"
@interface FithVipTableViewCell()
{
    UIImageView *_lticon;
    UIImageView *_rticon;
    UILabel *cellTitle;
}

@end
@implementation FithVipTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgview];
    
    _lticon  = [[UIImageView alloc] init];
    
    _lticon.frame = CGRectMake(12.5, 12.5, 20, 20);
    [bgview addSubview:_lticon];
    
    cellTitle = [[UILabel alloc] init];
    cellTitle.frame = CGRectMake(CGRectGetMaxX(_lticon.frame)+5, bgview.frame.size.height/2-20/2, 180, 20);
    //测试位置
    cellTitle.backgroundColor = [UIColor clearColor];
    cellTitle.font = [UIFont systemFontOfSize:14];
    [bgview addSubview:cellTitle];
    
    _rticon  = [[UIImageView alloc] init];
    _rticon.frame = CGRectMake(SCREEN_WIDTH-20, 16.5, 12, 12);
    [bgview addSubview:_rticon];
    //cell之间分割线
    UIView *downLine = [[UIView alloc] initWithFrame:CGRectMake(0, 44.5, SCREEN_WIDTH, 0.5)];
    downLine.backgroundColor = [UIColor colorWithRed:194/255.0f green:194/255.0f blue:194/255.0f alpha:1.0f];
    [bgview addSubview:downLine];
    
    
    
}
-(void)updateFithVipdata{
    cellTitle.text = _data.title;
    _lticon.image = [UIImage imageNamed:_data.ltIcon];
    _rticon.image = [UIImage imageNamed:_data.rtIcon];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
