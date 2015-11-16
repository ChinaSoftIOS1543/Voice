//
//  FourthSecondChatCell.h
//  SingPub
//
//  Created by 中软mini007 on 15/11/13.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FourthSecondChatCellData.h"
@interface FourthSecondChatCell : UITableViewCell

@property(nonatomic,strong)FourthSecondChatCellData * data;

-(void)updateChatCell;

@end
