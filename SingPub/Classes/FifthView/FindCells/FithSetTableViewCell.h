//
//  FithSetTableViewCell.h
//  SingPub
//
//  Created by apple on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FithSetData.h"
@interface FithSetTableViewCell : UITableViewCell

@property (nonatomic,strong)FithSetData *data;

-(void)updateFithSetCell;
@end
