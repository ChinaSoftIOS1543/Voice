//
//  FithFindFrTableViewCell.m
//  SingPub
//
//  Created by apple on 15/11/11.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FithFindFrTableViewCell.h"

@interface FithFindFrTableViewCell()
{
    UIImageView *_userImg;
    UILabel *_userName;
    UILabel *_userLv;
    UILabel *_likeInfo;
    UIImageView *_lvImg;
}
@end

@implementation FithFindFrTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

-(void)initUI{
    _userImg = [[UIImageView alloc] init];
    _userImg.frame = CGRectMake(7, 7, 40, 40);
    //测试位置
    _userImg.backgroundColor = [UIColor blackColor];
    [self addSubview:_userImg];
    
    _userName = [[UILabel alloc] init];
    _userName.font = [UIFont systemFontOfSize:15];
    _userName.textColor = [UIColor colorWithRed:215/255.0f green:161/255.0f blue:57/255.0f alpha:1.0f];
    
    _userName.frame = CGRectMake(CGRectGetMaxX(_userImg.frame)+7, 5, 90, 20);
//    CGSize size = CGSizeMake(300, 1000);
//    CGSize labelSize = [_userName.text sizeWithFont:_userName.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
//    _userName.frame = CGRectMake(_userName.frame.origin.x, _userName.frame.origin.y, labelSize.width, labelSize.height);
    [self addSubview:_userName];
    
    _lvImg = [[UIImageView alloc] init];
    _lvImg.frame = CGRectMake(CGRectGetMaxX(_userName.frame), 7, 15, 15);
    //测试位置
    _lvImg.backgroundColor = [UIColor redColor];
    [self addSubview:_lvImg];
    
    _userLv = [[UILabel alloc] init];
    _userLv.frame = CGRectMake(CGRectGetMaxX(_userImg.frame)+7, CGRectGetMaxY(_userName.frame), 70, 15);
    _userLv.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    _userLv.font = [UIFont systemFontOfSize:12];
    [self addSubview:_userLv];
    
    _userInfo = [[UILabel alloc] init];
    _userInfo.frame = CGRectMake(7, CGRectGetMaxY(_userImg.frame)+10, SCREEN_WIDTH-7*2, 20);
    _userInfo.font = [UIFont systemFontOfSize:12];
    _userInfo.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    [self addSubview:_userInfo];
    
    _likeInfo = [[UILabel alloc] init];
    _likeInfo.frame = CGRectMake(7, CGRectGetMaxY(_userInfo.frame)+5, SCREEN_WIDTH-7*2, 30);
    [self addSubview:_likeInfo];
    
}
//赋值 and 自动换行,计算出cell的高度
-(void)setUserInfoText:(NSString*)text{
    //获得当前cell高度
    CGRect frame = [self frame];
    //文本赋值
    self.userInfo.text = text;
    //设置label的最大行数
    self.userInfo.numberOfLines = 10;
    CGSize size = CGSizeMake(300, 1000);
    CGSize labelSize = [self.userInfo.text sizeWithFont:self.userInfo.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    self.userInfo.frame = CGRectMake(self.userInfo.frame.origin.x, self.userInfo.frame.origin.y, labelSize.width, labelSize.height);
    
    //计算出自适应的高度
    frame.size.height = labelSize.height+80;
    
    self.frame = frame;
}


-(void)updateFithFindFrdata{
    _userImg.image = [UIImage imageNamed:_data.userImg];
    _userName.text = _data.userName;
    _lvImg.image = [UIImage imageNamed:_data.lvImg];
    _userLv.text = _data.lvText;
    _likeInfo.text = _data.likeInfo;
    [self setUserInfoText:_data.UserInfo];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
