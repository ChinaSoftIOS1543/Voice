//
//  ThirdSingingHeaderView.h
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdSingingHeaderViewData.h"

@protocol ThirdSingingHeaderViewDelegate <NSObject>

-(void)logoSingingHeaderViewClicked:(id)sender;

@end

@interface ThirdSingingHeaderView : UIView

@property(nonatomic,strong)ThirdSingingHeaderViewData * headerData;

@property(nonatomic,weak)id<ThirdSingingHeaderViewDelegate>delegate;

-(void)updateSingingHeaderView;

@end
