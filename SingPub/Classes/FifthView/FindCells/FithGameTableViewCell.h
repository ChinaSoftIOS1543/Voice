//
//  FithGameTableViewCell.h
//  SingPub
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FithGameData.h"

@interface FithGameTableViewCell : UITableViewCell

@property (nonatomic,strong) FithGameData *data;

-(void)updateFithGamedata;
@end
