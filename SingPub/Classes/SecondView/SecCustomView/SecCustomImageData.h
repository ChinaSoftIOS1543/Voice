//
//  SecCustomImageData.h
//  SingPub
//
//  Created by 中软mini005 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecCustomImageData : NSObject

@property(nonatomic,copy)NSString *dataImage;
@property(nonatomic,copy)NSString *dataName;

+(id)shareIntances;
-(NSArray *)getMyData;

@end
