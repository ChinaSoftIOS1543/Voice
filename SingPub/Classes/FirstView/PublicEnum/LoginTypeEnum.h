//
//  LoginTypeEnum.h
//  SingPub
//
//  Created by 中软mini017 on 15/11/5.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#ifndef LoginTypeEnum_h
#define LoginTypeEnum_h

//什么地方
typedef NS_ENUM(NSInteger, LoginEnumType) {
    
    LoginEnumTypeNone,
    LoginEnumTypeNot,//没有登录
    LoginEnumTypeFinish,//已经登录
    LoginEnumTypeMax
    
};
#endif /* LoginTypeEnum_h */
