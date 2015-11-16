//
//  ThirdSingStarTableViewCell.h
//  SingPub
//
//  Created by 中软mini011 on 15/11/12.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThirdSingStarTableViewCellData;

@protocol ThirdSingStarTableViewCellDelegate <NSObject>

-(void)ThirdSingStarClickedWithImageView;

@end

@interface ThirdSingStarTableViewCell : UITableViewCell

@property(nonatomic,strong)ThirdSingStarTableViewCellData * Data;

@property(nonatomic,weak)id<ThirdSingStarTableViewCellDelegate>delegate;

-(void)updateSingStarCell;

@end
