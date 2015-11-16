//
//  Engin.h
//  ChangBaProject
//
//  Created by apple on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engin : NSObject
+(id)sharInstance;
-(NSDictionary *)getFinddata;
-(NSDictionary *)getFindSetdata;
-(NSDictionary *)getFithVipdata;
-(NSDictionary *)getFithGamedata;
-(NSDictionary *)getFindFrdata;
@end
