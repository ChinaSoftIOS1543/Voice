//
//  FourthMessageCell.h
//  SingPub
//
//  Created by 中软mini007 on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FourthMessageCellData.h"

@interface FourthMessageCell : UITableViewCell

@property(nonatomic,strong)FourthMessageCellData* data;

-(void)updateMessageCell;

@end
