//
//  FithVipTableViewCell.h
//  SingPub
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FithVIPData.h"
@interface FithVipTableViewCell : UITableViewCell

@property (nonatomic,strong) FithVIPData *data;

-(void)updateFithVipdata;

@end
