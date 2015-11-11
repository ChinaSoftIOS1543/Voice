//
//  HeaderView.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderViewData.h"

@interface HeaderView : UIView

@property(nonatomic,strong)HeaderViewData *data;


-(void)updataHeaderViewInfo;

@end
