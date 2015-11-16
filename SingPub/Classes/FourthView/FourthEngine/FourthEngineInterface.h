//
//  FourthEngineInterface.h
//  SingPub
//
//  Created by 中软mini007 on 15/11/12.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FourthEngineInterface : NSObject

+(id)shareInstance;

-(NSDictionary* )getFourthCellDataSource;
-(NSDictionary* )getFourthSecondCellDataSource;
@end
