//
//  FithGameTableViewCell.m
//  SingPub
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithGameTableViewCell.h"
@interface FithGameTableViewCell(){
    UIImageView *_lticon;
    UILabel *_gameTitle;
    UILabel *_advTitle;
    
    
}

@end
@implementation FithGameTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgview];
    
    _lticon = [[UIImageView alloc] init];
    _lticon.frame = CGRectMake(7, 7, 50, 50);
    _lticon.backgroundColor = [UIColor redColor];
    [bgview addSubview:_lticon];
    
    _gameTitle = [[UILabel alloc] init];
    _gameTitle.frame = CGRectMake(CGRectGetMaxX(_lticon.frame)+7, 7, 100, 30);
    _gameTitle.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:_gameTitle];
    
    _advTitle = [[UILabel alloc] init];
    _advTitle.frame = CGRectMake(CGRectGetMaxX(_lticon.frame)+7, CGRectGetMaxY(_gameTitle.frame), 200, 20);
    _advTitle.font = [UIFont systemFontOfSize:13];
    _advTitle.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    [bgview addSubview:_advTitle];
    
    //cell之间分割线
    UIView *downLine = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    downLine.backgroundColor = [UIColor colorWithRed:194/255.0f green:194/255.0f blue:194/255.0f alpha:1.0f];
    [bgview addSubview:downLine];
    
}
-(void)updateFithGamedata{
    _gameTitle.text = _data.title;
    _advTitle.text = _data.advtitle;
    _lticon.image = [UIImage imageNamed:_data.ltIcon];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
