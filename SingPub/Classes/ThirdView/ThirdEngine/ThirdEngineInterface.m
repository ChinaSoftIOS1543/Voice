//
//  ThirdEngineInterface.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdEngineInterface.h"

#import "ThirdSingingTableViewCellData.h"


#import "ThirdSingStarTableViewCellData.h"
#import "ThirdClassifyTableViewCellData.h"

@implementation ThirdEngineInterface

+(id)shareInstance
{
    static ThirdEngineInterface * instance = nil;
    
    if (instance == nil)
    {
        instance = [[ThirdEngineInterface alloc] init];
    }
    
    return instance;
}

-(NSDictionary *)getThirdSingingTableViewData
{
    NSMutableDictionary * dic1 = [[NSMutableDictionary alloc] init];
    
    NSMutableArray * array1 = [[NSMutableArray alloc] init];
    ThirdSingingTableViewCellData * data10 = [[ThirdSingingTableViewCellData alloc] init];
    data10._frontImageName =@"F_IMA_NA0.png";
    data10._label1Name = @"玫瑰花的葬礼";
    data10._label2Name = @"9.87M-国语精选 - 许嵩";
    data10._singButtonName = @"演唱";
    [array1 addObject:data10];
    
    ThirdSingingTableViewCellData * data11 = [[ThirdSingingTableViewCellData alloc] init];
    data11._frontImageName = @"F_IMA_NA1.png";
    data11._label1Name = @"原来你也在这里";
    data11._label2Name = @"8.45M - 刘若英";
    data11._singButtonName = @"演唱";
    [array1 addObject:data11];
    
    ThirdSingingTableViewCellData * data12 = [[ThirdSingingTableViewCellData alloc] init];
    data12._frontImageName = @"F_IMA_NA2.png";
    data12._label1Name = @"胆小鬼";
    data12._label2Name =@"9.94M - 梁咏琪";
    data12._singButtonName = @"演唱";
    [array1 addObject:data12];
    
    ThirdSingingTableViewCellData * data13 = [[ThirdSingingTableViewCellData alloc] init];
    data13._frontImageName = @"F_IMA_NA3.png";
    data13._label1Name =@"爱我的人和我爱的人";
    data13._label2Name = @"10.39M-国语精选 - 游鸿明";
    data13._singButtonName = @"演唱";
    [array1 addObject:data13];
    
    ThirdSingingTableViewCellData * data14 = [[ThirdSingingTableViewCellData alloc] init];
    data14._frontImageName = @"F_IMA_NA4.png";
    data14._label1Name =@"会呼吸的痛";
    data14._label2Name =@"10.44M-国语精选 - 梁静茹";
    data14._singButtonName = @"演唱";
    [array1 addObject:data14];
    
    ThirdSingingTableViewCellData * data15 = [[ThirdSingingTableViewCellData alloc] init];
    data15._frontImageName =@"F_IMA_NA5.png";
    data15._label1Name = @"问";
    data15._label2Name = @"7.8M-国语精选 - 梁静茹";
    data15._singButtonName = @"演唱";
    [array1 addObject:data15];
    
    ThirdSingingTableViewCellData * data16 = [[ThirdSingingTableViewCellData alloc] init];
    data16._frontImageName = @"F_IMA_NA6.png";
    data16._label1Name = @"记得";
    data16._label2Name = @"5.45M - 张惠妹";
    data16._singButtonName = @"演唱";
    [array1 addObject:data16];
    
    ThirdSingingTableViewCellData * data17 = [[ThirdSingingTableViewCellData alloc] init];
    data17._frontImageName = @"F_IMA_NA7.png";
    data17._label1Name = @"背对背的拥抱";
    data17._label2Name =@"8.91M - 林俊杰";
    data17._singButtonName = @"演唱";
    [array1 addObject:data17];
    
    ThirdSingingTableViewCellData * data18 = [[ThirdSingingTableViewCellData alloc] init];
    data18._frontImageName = @"F_IMA_NA8.png";
    data18._label1Name =@"千千阙歌";
    data18._label2Name = @"4.5M-粤语经典 - 陈慧娴";
    data18._singButtonName = @"演唱";
    [array1 addObject:data18];
    
    ThirdSingingTableViewCellData * data19 = [[ThirdSingingTableViewCellData alloc] init];
    data19._frontImageName = @"F_IMA_NA9.png";
    data19._label1Name =@"新生【一年级 第二季主题曲】";
    data19._label2Name =@"4.85M-群星";
    data19._singButtonName = @"演唱";
    [array1 addObject:data19];
    
    [dic1 setObject:array1 forKey:@"array1"];
    
    return dic1;
}

-(ThirdSingingHeaderViewData *)getThirdSingingHeaderViewData
{
    ThirdSingingHeaderViewData * singHeaderViewData = [[ThirdSingingHeaderViewData alloc] init];
    
    singHeaderViewData._button1Name = @"gexingdiange@2x.png";
    
    singHeaderViewData._button2Name = @"fanleidiange@2x.png";
    
    singHeaderViewData._button3Name = @"jingcaihechang@2x.png";
    
    singHeaderViewData._button4Name = @"qiangchangbiaoyan@2x.png";
    
    singHeaderViewData._label1Name = @"歌星点歌";
    
    singHeaderViewData._label2Name = @"分类点歌";
    
    singHeaderViewData._label3Name =@"精彩合唱";
    
    singHeaderViewData._label4Name = @"清唱表演";
    
    return singHeaderViewData;
}

-(NSDictionary *)getThirdSingStarTableViewData
{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    NSMutableArray * starArray1 = [[NSMutableArray alloc] init];
    ThirdSingStarTableViewCellData * data10 = [[ThirdSingStarTableViewCellData alloc] init];
    data10._labelName = @"华语男歌星";
    
    ThirdSingStarTableViewCellData * data11 = [[ThirdSingStarTableViewCellData alloc] init];
    data11._labelName = @"华语女歌星";

    ThirdSingStarTableViewCellData * data12 = [[ThirdSingStarTableViewCellData alloc] init];
    data12._labelName = @"华语乐队组合";
    
    [starArray1 addObject:data10];
    [starArray1 addObject:data11];
    [starArray1 addObject:data12];

    NSMutableArray * starArray2 = [[NSMutableArray alloc] init];
    ThirdSingStarTableViewCellData * data20 = [[ThirdSingStarTableViewCellData alloc] init];
    data20._labelName = @"欧美男歌星";
    
    ThirdSingStarTableViewCellData * data21 = [[ThirdSingStarTableViewCellData alloc] init];
    data21._labelName = @"欧美女歌星";
    
    ThirdSingStarTableViewCellData * data22 = [[ThirdSingStarTableViewCellData alloc] init];
    data22._labelName = @"欧美乐队组合";
    
    [starArray2 addObject:data20];
    [starArray2 addObject:data21];
    [starArray2 addObject:data22];

    NSMutableArray * starArray3 = [[NSMutableArray alloc] init];

    ThirdSingStarTableViewCellData * data30 = [[ThirdSingStarTableViewCellData alloc] init];
    data30._labelName = @"日韩男歌星";
    
    ThirdSingStarTableViewCellData * data31 = [[ThirdSingStarTableViewCellData alloc] init];
    data31._labelName = @"日韩女歌星";
    
    ThirdSingStarTableViewCellData * data32 = [[ThirdSingStarTableViewCellData alloc] init];
    data32._labelName = @"日韩乐队组合";
    
    [starArray3 addObject:data10];
    [starArray3 addObject:data11];
    [starArray3 addObject:data12];

    
    [dic setObject:starArray1 forKey:@"starArray1"];
    
    [dic setObject:starArray2 forKey:@"starArray2"];

    [dic setObject:starArray3 forKey:@"starArray3"];
    
    
    
    return dic;

}

-(NSDictionary *)getThirdClassifyTableViewData
{
    NSMutableDictionary * dic3 = [[NSMutableDictionary alloc] init];
    
    NSMutableArray * classArray1 = [[NSMutableArray alloc] init];
    
    ThirdClassifyTableViewCellData * data0 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data0._labelName = @"国语精选";
    
    [classArray1 addObject:data0];
    
    ThirdClassifyTableViewCellData * data1 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data1._labelName = @"热力摇滚";
    
    [classArray1 addObject:data1];

    ThirdClassifyTableViewCellData * data2 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data2._labelName = @"文艺民谣";
    
    [classArray1 addObject:data2];

    ThirdClassifyTableViewCellData * data3 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data3._labelName = @"优雅古风";
    
    [classArray1 addObject:data3];

    ThirdClassifyTableViewCellData * data4 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data4._labelName = @"日系动漫";
    
    [classArray1 addObject:data4];

    ThirdClassifyTableViewCellData * data5 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data5._labelName = @"经典外语";
    
    [classArray1 addObject:data5];
    
    ThirdClassifyTableViewCellData * data6 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data6._labelName = @"R&B";
    
    [classArray1 addObject:data6];
    
    ThirdClassifyTableViewCellData * data7 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data7._labelName = @"粤语经典";
    
    [classArray1 addObject:data7];
    
    ThirdClassifyTableViewCellData * data8 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data8._labelName = @"红色歌曲";
    
    [classArray1 addObject:data8];
    
    ThirdClassifyTableViewCellData * data9 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data9._labelName = @"情歌对唱";
    
    [classArray1 addObject:data9];
    
    ThirdClassifyTableViewCellData * data10 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data10._labelName = @"儿童歌曲";
    
    [classArray1 addObject:data10];
    
    ThirdClassifyTableViewCellData * data11 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data11._labelName = @"网络歌曲";
    
    [classArray1 addObject:data11];
    
    ThirdClassifyTableViewCellData * data12 = [[ThirdClassifyTableViewCellData alloc] init];
    
    data12._labelName = @"闽南民谣";
    
    [classArray1 addObject:data12];

    [dic3 setObject:classArray1 forKey:@"classArray1"];
    return dic3;
}
@end
