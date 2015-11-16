//
//  MineTableViewCell.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/9.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineCellData.h"

@interface MineTableViewCell : UITableViewCell

@property(nonatomic,strong)MineCellData *data;

-(void)updataMiewCellInfo;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
