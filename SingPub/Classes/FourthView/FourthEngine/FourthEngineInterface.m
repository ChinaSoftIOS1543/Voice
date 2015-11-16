//
//  FourthEngineInterface.m
//  SingPub
//
//  Created by 中软mini007 on 15/11/12.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "FourthEngineInterface.h"
#import "FourthMessageCellData.h"
#import "FourthSecondChatCellData.h"


@implementation FourthEngineInterface


static FourthEngineInterface *instance = nil;

+(id)shareInstance
{
    @synchronized(self){
        if (instance == nil) {
            instance = [[FourthEngineInterface alloc] init];
        }
    }
    return instance;
}

-(NSDictionary* )getFourthCellDataSource{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    NSMutableArray* array1 = [[NSMutableArray alloc] init];
    
    FourthMessageCellData* data11 = [[FourthMessageCellData alloc] init];
    data11.imageName = @"";
    data11.title1Name = @"编辑精选";
    data11.title2Name = @"K歌秘籍之如何制服麦霸，抢回属于";
    data11.title3Name = @"昨天";
    [array1 addObject:data11];
    
    FourthMessageCellData* data22 = [[FourthMessageCellData alloc] init];
    data22.imageName = @"";
    data22.title1Name = @"官方公告";
    data22.title2Name = @"恭喜你！获得。。。。。。";
    data22.title3Name = @"11-01";
    [array1 addObject:data22];
    
    FourthMessageCellData* data33 = [[FourthMessageCellData alloc] init];
    data33.imageName = @"";
    data33.title1Name = @"你还没有加入群聊";
    data33.title2Name = @"假如一个志同道合的。。。。";
    data33.title3Name = @"10-30";
    [array1 addObject:data33];
    
    FourthMessageCellData* data44 = [[FourthMessageCellData alloc] init];
    data44.imageName = @"";
    data44.title1Name = @"游戏消息";
    data44.title2Name = @"有人@你 ［龙珠三国］福利送不停";
    data44.title3Name = @"10-30";
    [array1 addObject:data44];
    
    [dic setObject:array1 forKey:@"array1"];
    
    return  dic;
}

-(NSDictionary* )getFourthSecondCellDataSource{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    NSMutableArray* array1 = [[NSMutableArray alloc] init];
    
    FourthSecondChatCellData* data11 = [[FourthSecondChatCellData alloc] init];
    data11.imageName = @"";
    data11.titleName = @"编辑精选";
    
    [array1 addObject:data11];
    
    FourthSecondChatCellData* data22 = [[FourthSecondChatCellData alloc] init];
    data22.imageName = @"";
    data22.titleName = @"官方公告";
   
    [array1 addObject:data22];
    
    FourthSecondChatCellData* data33 = [[FourthSecondChatCellData alloc] init];
    data33.imageName = @"";
    data33.titleName = @"你还没有加入群聊";
    [array1 addObject:data33];
    
    FourthSecondChatCellData* data44 = [[FourthSecondChatCellData alloc] init];
    data44.imageName = @"";
    data44.titleName = @"游戏消息";
    
    [array1 addObject:data44];
    
    [dic setObject:array1 forKey:@"array1"];
    
    return  dic;
}



















@end
