//
//  FithFindFrTableViewCell.h
//  SingPub
//
//  Created by apple on 15/11/11.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FithFindFrData.h"
@interface FithFindFrTableViewCell : UITableViewCell

@property (nonatomic,strong) FithFindFrData *data;
@property (nonatomic,retain) UILabel *userInfo;


-(void)updateFithFindFrdata;
-(void)setUserInfoText:(NSString*)text;

@end
