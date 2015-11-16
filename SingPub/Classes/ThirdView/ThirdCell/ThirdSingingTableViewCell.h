//
//  ThirdSingingTableViewCell.h
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdSingingTableViewCellData.h"

@protocol ThirdSingingTableViewCellDelegate <NSObject>

-(void)ThirdSingingCellClickedWithImageView;

@end

@interface ThirdSingingTableViewCell : UITableViewCell

@property(nonatomic,weak)id<ThirdSingingTableViewCellDelegate>delegate;

@property(nonatomic,strong)ThirdSingingTableViewCellData * Data;

-(void)updateSingingCell;

@end
