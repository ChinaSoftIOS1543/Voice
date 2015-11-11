//
//  CustomPeopleImage.h
//  SingPub
//
//  Created by 中软mini005 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomPeopleImageDeldgate <NSObject>

-(void)CustomPeopleClick:(id)sender;

@end

@interface CustomPeopleImage : UIView

@property (nonatomic,weak)id<CustomPeopleImageDeldgate>delegate;

@end
