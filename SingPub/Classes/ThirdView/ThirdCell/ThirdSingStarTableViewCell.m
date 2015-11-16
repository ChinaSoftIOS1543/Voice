//
//  ThirdSingStarTableViewCell.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/12.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdSingStarTableViewCell.h"
#import "ThirdSingStarTableViewCellData.h"

@interface ThirdSingStarTableViewCell ()
{
    UIView * _bgView;
    
    UILabel * _lalel;
}


@end


@implementation ThirdSingStarTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self initCell];
    }
    
    return self;
}


-(void)initCell
{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    
    [self.contentView addSubview:_bgView];
    
    _lalel = [[UILabel alloc ] initWithFrame:CGRectMake(10, 10, 200, 30)];
    
    _lalel.textColor = [UIColor colorWithRed:61/255.0 green:62/255.0 blue:63/255.0 alpha:1];
    
    _lalel.font = [UIFont systemFontOfSize:14];
    
    [_bgView addSubview:_lalel];
    
}


-(void)updateSingStarCell
{
    _lalel.text = _Data._labelName;
}
@end
