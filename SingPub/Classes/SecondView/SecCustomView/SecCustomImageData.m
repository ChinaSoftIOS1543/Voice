//
//  SecCustomImageData.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecCustomImageData.h"

@implementation SecCustomImageData

+(id)shareIntances
{
    static SecCustomImageData *instance;
    @synchronized(self){
        if(instance==nil)
            instance=[[SecCustomImageData alloc]init];
    }
    return instance;
}

-(NSArray *)getMyData{
    
    NSMutableArray * arr=[[NSMutableArray alloc] init];
// NSDictionary * dic=[[NSDictionary alloc] initWithObjectsAndKeys:
//                    @"quanguobang.png",@"1",
//                    @"zongbang.png",@"2",
//                    @"cainixihuan.png",@"3",
//                    @"Kgexiu.png",@"4",
//                    @"youzhimv.png",@"5",
//                    @"jingcaihechang.png",@"6",
//                    @"dongtingdanqv.png",@"7",
//                    @"gedan.png",@"8",nil];
    
    SecCustomImageData * data3=[[SecCustomImageData alloc] init];
    data3.dataImage=@"cainixihuan.png";
    data3.dataName=@"猜你喜欢";
    [arr addObject:data3];
    
    SecCustomImageData * data8=[[SecCustomImageData alloc] init];
    data8.dataImage=@"gedan.png";
    data8.dataName=@"歌单";
    [arr addObject:data8];
    
    SecCustomImageData * data7=[[SecCustomImageData alloc] init];
    data7.dataImage=@"dongtingdanqv.png";
    data7.dataName=@"动听单曲";
    [arr addObject:data7];
    
    SecCustomImageData * data5=[[SecCustomImageData alloc] init];
    data5.dataImage=@"youzhimv.png";
    data5.dataName=@"优质MV";
    [arr addObject:data5];
    
    
    SecCustomImageData * data2=[[SecCustomImageData alloc] init];
    data2.dataImage=@"zongbang.png";
    data2.dataName=@"总榜";
    [arr addObject:data2];
    
    SecCustomImageData * data1=[[SecCustomImageData alloc] init];
    data1.dataImage=@"quanguobang.png";
    data1.dataName=@"全国榜";
    [arr addObject:data1];
    
    SecCustomImageData * data4=[[SecCustomImageData alloc] init];
    data4.dataImage=@"Kgexiu.png";
    data4.dataName=@"K歌秀";
    [arr addObject:data4];
    
    
    SecCustomImageData * data6=[[SecCustomImageData alloc] init];
    data6.dataImage=@"jingcaihechang.png";
    data6.dataName=@"精彩合唱";
    [arr addObject:data6];
    
    
    
    
    return arr;
}
@end
