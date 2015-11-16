//
//  UserInfomation.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/5.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginTypeEnum.h"

@interface UserInfomation : NSObject

@property(nonatomic,retain)NSString *userImage;
@property(nonatomic,retain)NSString *userSingPubNum;
@property(nonatomic,assign)LoginEnumType type;

@end
