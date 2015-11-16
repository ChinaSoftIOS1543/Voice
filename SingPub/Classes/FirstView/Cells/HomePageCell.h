//
//  HomePageCell.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageCellData.h"

@interface HomePageCell : UITableViewCell

@property(nonatomic,strong)HomePageCellData *data;

//给用户推荐赋值并实现自动换行
-(void)setUserRecommendText:(NSString *)text;
//初始化cell

-(id)initReuseIdentifier:(NSString *)reuseIdentifier;
-(void)updataHomePageCellInfo;

@end
