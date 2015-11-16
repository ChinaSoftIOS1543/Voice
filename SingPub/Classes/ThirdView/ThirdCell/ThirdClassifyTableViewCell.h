//
//  ThirdClassifyTableViewCell.h
//  SingPub
//
//  Created by 中软mini011 on 15/11/12.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThirdClassifyTableViewCellData;

@protocol ThirdClassifyTableViewCellDelegate <NSObject>

-(void)ThirdClassifyClickedWithImageView;

@end

@interface ThirdClassifyTableViewCell : UITableViewCell

@property(nonatomic,strong)ThirdClassifyTableViewCellData * Data;

@property(nonatomic,weak)id<ThirdClassifyTableViewCellDelegate>delegate;

-(void)updateClassifyCell;

@end
