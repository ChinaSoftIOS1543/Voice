//
//  SelfInfoCell.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/5.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelfInfoCellData.h"

@interface SelfInfoCell : UITableViewCell

@property(nonatomic,strong)SelfInfoCellData *data;

-(void)updataSelfInfoCellData;

@end
