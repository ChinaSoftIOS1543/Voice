//
//  ThirdEngineInterface.h
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ThirdSingingHeaderViewData.h"


@interface ThirdEngineInterface : NSObject

+(id)shareInstance;

-(NSDictionary *)getThirdSingingTableViewData;

-(ThirdSingingHeaderViewData *)getThirdSingingHeaderViewData;

-(NSDictionary *)getThirdSingStarTableViewData;

-(NSDictionary *)getThirdClassifyTableViewData;
@end
