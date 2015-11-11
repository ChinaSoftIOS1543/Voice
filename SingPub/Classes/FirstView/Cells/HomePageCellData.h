//
//  HomePageCellData.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageCellData : NSObject

@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *singName;
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *labelText;
@property(nonatomic,assign)NSInteger *audienceNumber;//观众人数
@property(nonatomic,assign)NSInteger *presentNumber;//礼物数量
@property(nonatomic,assign)NSInteger *reprintNumber;//转载数量

@end
