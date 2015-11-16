//
//  ThirdClassifyTableViewCell.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/12.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdClassifyTableViewCell.h"
#import "ThirdClassifyTableViewCellData.h"

@interface ThirdClassifyTableViewCell ()
{
    UIView * _bgView;
    
    UILabel * _label;
}

@end

@implementation ThirdClassifyTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        [self initCell];
    }
    
    return self;
}

-(void)initCell
{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    
    [self.contentView addSubview:_bgView];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 25)];
    
    _label.font = [UIFont systemFontOfSize:12];
    
    _label.textColor = [UIColor colorWithRed:61/255.0 green:62/255.0 blue:63/255.0 alpha:1];
    
    [_bgView addSubview:_label];
}


-(void)updateClassifyCell
{
    _label.text = _Data._labelName;
}
@end
