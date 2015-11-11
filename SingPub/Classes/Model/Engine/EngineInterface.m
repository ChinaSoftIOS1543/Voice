//
//  EngineInterface.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/3.
//  Copyright (c) 2015年 中软mini011. All rights reserved.
//

#import "EngineInterface.h"

@implementation EngineInterface

-(NSDictionary*)readPlist{
    NSString* paths = [[NSBundle mainBundle] pathForResource:@"citydict" ofType:@"plist"];
    
    NSDictionary* dicList = [NSDictionary dictionaryWithContentsOfFile:paths];
    
    return dicList;
}

@end
