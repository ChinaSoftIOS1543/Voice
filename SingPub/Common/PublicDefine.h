//
//  PublicDefine.h
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#ifndef SingPub_PublicDefine_h
#define SingPub_PublicDefine_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define Request_Button 5000
#define Classify_Button 5100
#define Wonderful_Button 5200
#define SingSong_Button 5300


//枚举ScollerView
typedef NS_ENUM(NSInteger ,HWScrollViewType)
{
    HWScrollViewTypeNone,
    
    HWScrollViewTypeFuction,
    
    HWScrollViewTypeBanner,
    
    HWScrollViewTypeMax
};

#endif
