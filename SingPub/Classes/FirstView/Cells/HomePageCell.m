//
//  HomePageCell.m
//  SingPub
//
//  Created by 中软mini017 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "HomePageCell.h"

@interface HomePageCell(){
    
    UILabel *songLaabel;
    UILabel *label1;    //听众人数
    UILabel *label2;    //礼物数量
    UILabel *label3;    //转发数量
    UILabel *label4;    //评论数量
    
    UILabel *userName;
    UIImageView *userRank;  //用户等级
    UIImageView *userJudge; //用户评价
}

@property(nonatomic,retain)UIView *userNameView;            //用户名字
@property(nonatomic,retain)UIImageView *userHeaderImage;//用户头像
@property(nonatomic,retain)UIImageView *stateImage;     //类型（左上角）
@property(nonatomic,retain)UIImageView *MVImage;        //MV
@property(nonatomic,retain)UIImageView *imagineImage;   //推荐
@property(nonatomic,retain)UIView *songInfo;            //歌区信息
@property(nonatomic,retain)UILabel *userRecommend;      //用户推荐语

@end

@implementation HomePageCell

-(id)initReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
    }
    return self;
}

//初始化控件
-(void)initLayout{
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 170)];
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = [[UIColor grayColor] CGColor];
    [self addSubview:bgView];
    
    //类型（yes->显示NEW）
    _stateImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [bgView addSubview:_stateImage];
    _stateImage.image = [UIImage imageNamed:@"timeline_new_icon.png"];
    
    //用户头像
    _userHeaderImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_stateImage.frame)+5, 10, 60, 60)];
    [bgView addSubview:_userHeaderImage];
    
    //用户名字
    _userNameView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_userHeaderImage.frame)+10, 10, bgView.frame.size.width-140, 20)];
    [self initUserName];
    [bgView addSubview:_userNameView];
    
    //歌区信息
    _songInfo = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_userHeaderImage.frame)+10, CGRectGetMaxY(_userNameView.frame)+5, bgView.frame.size.width-140, 60)];
    [self initSongInfoView];
    [bgView addSubview:_songInfo];
    
    //mv标志
    _MVImage = [[UIImageView alloc] initWithFrame:CGRectMake(bgView.frame.size.width-55, 0, 20, 20)];
    _MVImage.image = [UIImage imageNamed:@"MV.png"];
    [bgView addSubview:_MVImage];
    
    //推荐标志
    _imagineImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_MVImage.frame)+5, 0, 20, 20)];
    _imagineImage.image = [UIImage imageNamed:@"tuijian.png"];
    [bgView addSubview:_imagineImage];
    
    //[self setUserRecommendText];
    
//    //用户推荐语
//    _userRecommend = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_songInfo.frame)+10, bgView.frame.size.width-20, 45)];
//    _userRecommend.layer.borderWidth = 0.5;
//    _userRecommend.layer.borderColor = [[UIColor grayColor]CGColor];
//    [bgView addSubview:_userRecommend];
}

-(void)initUserName{
    userName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    userName.textColor = [UIColor redColor];
    [_userNameView addSubview:userName];
    
    
    userRank = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userName.frame), 0, 20, 20)];
    [_userNameView addSubview:userRank];
    userJudge = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userRank.frame), 0, 20, 20)];
    [_userNameView addSubview:userJudge];
}

-(void)setUserRecommendText:(NSString *)text{
    
    _userRecommend = [[UILabel alloc] init];
    
    //获得当前cell高度
    CGRect frame = [self frame];
    _userRecommend.layer.borderColor = [[UIColor grayColor]CGColor];
    _userRecommend.layer.borderWidth = 1;
    
    //文本赋值
    self.userRecommend.text = text;
    
    //设置label的最大行数
    _userRecommend.numberOfLines = 5;
    CGSize size = CGSizeMake(self.frame.size.width-20, 120);
    CGSize labelSize = [_userRecommend.text sizeWithFont:self.userRecommend.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    _userRecommend.frame = CGRectMake(self.frame.origin.x+20+ _userRecommend.frame.origin.x, CGRectGetMaxY(_songInfo.frame)+10+ _userRecommend.frame.origin.y, labelSize.width-10, labelSize.height);
    
    //计算出自适应的高度
    frame.size.height = labelSize.height+50;
    self.frame = frame;
    [self addSubview:_userRecommend];
}

-(void)initSongInfoView{
    songLaabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.frame.size.width-10, self.frame.size.height/2)];
    [_songInfo addSubview:songLaabel];
    
    //听众人数
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:image1];
    image1.image = [UIImage imageNamed:@"erji.png"];
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+5, CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:label1];
    
    //礼物数量
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame)+5, CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:image2];
    image2.image = [UIImage imageNamed:@"liwu.png"];
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(image2.frame), CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:label2];
    
    //转发数量
    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label2.frame), CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:image3];
    image3.image = [UIImage imageNamed:@"zhuanfa.png"];
    label3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(image3.frame), CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:label3];
    
    //评论数量
    UIImageView *image4 = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label3.frame), CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:image4];
    image4.image = [UIImage imageNamed:@"pinglun.png"];
    label4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(image4.frame), CGRectGetMaxY(songLaabel.frame)+5, 15, 15)];
    [_songInfo addSubview:label4];
    
    
}

-(void)updataHomePageCellInfo{
    _userHeaderImage.image = [UIImage imageNamed:_data.userHeaderName];
    userName.font = [UIFont systemFontOfSize:14];
    userName.text = _data.userName;
    userRank.image = [UIImage imageNamed:@""];//用户等级
    userJudge.image = [UIImage imageNamed:@""];//用户评价
    //歌曲信息
    songLaabel.text = _data.songName;
    
    label1.text = [NSString stringWithFormat:@"%@",_data.audienceNumber];
    label1.font = [UIFont systemFontOfSize:12];
    label1.textColor = [UIColor grayColor];
    
    label2.text = [NSString stringWithFormat:@"%@",_data.presentNumber];
    label2.font = [UIFont systemFontOfSize:12];
    label2.textColor = [UIColor grayColor];
    
    label3.text = [NSString stringWithFormat:@"%@",_data.reprintNumber];
    label3.font = [UIFont systemFontOfSize:12];
    label3.textColor = [UIColor grayColor];
    
    label4.text = [NSString stringWithFormat:@"%@",_data.commentNumber];
    label4.font = [UIFont systemFontOfSize:12];
    label4.textColor = [UIColor grayColor];
    
     [self setUserRecommendText:_data.userRecommend] ;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
