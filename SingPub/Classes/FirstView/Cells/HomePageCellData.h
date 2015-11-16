//
//  HomePageCellData.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageCellData : NSObject

@property(nonatomic,copy)NSString *userName;            //用户名字
@property(nonatomic,copy)NSString *userHeaderName;      //用户头像
@property(nonatomic,copy)NSString *userRank;            //用户等级
@property(nonatomic,copy)NSString *userJudge;           //用户评价
@property(nonatomic,copy)NSString *userRecommend;       //用户推荐语

@property(nonatomic,copy)NSString *songName;            //歌曲名
@property(nonatomic,assign)NSNumber *audienceNumber;   //观众人数
@property(nonatomic,assign)NSNumber *presentNumber;    //礼物数量
@property(nonatomic,assign)NSNumber *reprintNumber;    //转载数量
@property(nonatomic,assign)NSNumber *commentNumber;    //评论数量


@end
