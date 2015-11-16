//
//  ThirdScrollerView.h
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ThirdScrollerViewDelegate <NSObject>

-(void)newScrollerViewImageViewWithIndex:(NSInteger)tag;

@end

@interface ThirdScrollerView : UIView

@property(nonatomic,assign)id<ThirdScrollerViewDelegate>delegate;

+(id)showScrollerView:(HWScrollViewType)type ImageArray:(NSArray *)image;

@end
