//
//  FindTableViewCell.h
//  ChangBaProject
//
//  Created by apple on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindData.h"
@interface FindTableViewCell : UITableViewCell

@property (nonatomic,strong)FindData *data;

-(void)updateFindCell;

@end
