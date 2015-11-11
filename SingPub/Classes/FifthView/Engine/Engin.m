//
//  Engin.m
//  ChangBaProject
//
//  Created by apple on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "Engin.h"
#import "FindData.h"
#import "FithSetData.h"
#import "FithVIPData.h"
#import "FithGameData.h"
@interface Engin(){
    NSArray *arr;
    NSMutableDictionary *dic;
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    NSMutableArray *arr5;
    NSMutableArray *arr6;
    NSMutableArray *arr7;
    NSMutableArray *arr8;
}
@end
@implementation Engin
static Engin *instance = nil;
+(id)sharInstance
{
    @synchronized(self) {
        if (instance == nil) {
            instance = [[Engin alloc] init];
        }
    }
    return instance;
}

-(NSDictionary *)getFinddata{
    dic = [[NSMutableDictionary alloc] init];
    arr1 = [[NSMutableArray alloc] init];
    arr2 = [[NSMutableArray alloc] init];
    arr3 = [[NSMutableArray alloc] init];
    arr4 = [[NSMutableArray alloc] init];
    
    FindData *data = [[FindData alloc] init];
    data.ltTitle = @"唱吧商城";
    data.ltIcon = @"changbashangcheng.png";
    data.rtIcon = @"arrow1.png";
    [arr1 addObject:data];
    
    FindData *data1 = [[FindData alloc] init];
    data1.ltTitle = @"唱吧直播间";
    data1.ltIcon = @"changbazhibojian.png";
    data1.rtIcon = @"arrow1.png";
    [arr2 addObject:data1];
    
    FindData *data2 = [[FindData alloc] init];
    data2.ltTitle = @"唱吧麦颂KTV";
    data2.ltIcon = @"ktv.png";
    data2.rtIcon = @"arrow1.png";
    [arr2 addObject:data2];
    
    FindData *data3 = [[FindData alloc] init];
    data3.ltTitle = @"扫描二维码";
    data3.ltIcon = @"erweima.png";
    data3.rtIcon = @"arrow1.png";
    [arr2 addObject:data3];
    
    FindData *data4 = [[FindData alloc] init];
    data4.ltTitle = @"会员中心";
    data4.ltIcon = @"vip.png";
    data4.rtIcon = @"arrow1.png";
    //这里判断当前帐号的会员是否开通，显示开通与否
    [arr3 addObject:data4];
    
    FindData *data5 = [[FindData alloc] init];
    data5.ltTitle = @"表情商店";
    data5.ltIcon = @"biaoqing.png";
    data5.rtIcon = @"arrow1.png";
    [arr3 addObject:data5];
    
    FindData *data6 = [[FindData alloc] init];
    data6.ltTitle = @"沃唱吧包流量服务";
    data6.rtTitle = @"仅限联通3G";
    data6.rtIcon = @"arrow1.png";
    data6.ltIcon = @"Wo.png";
    [arr4 addObject:data6];
    
    [dic setObject:arr1 forKey:@"arr1"];
    [dic setObject:arr2 forKey:@"arr2"];
    [dic setObject:arr3 forKey:@"arr3"];
    [dic setObject:arr4 forKey:@"arr4"];
    
    return dic;
}


//设置界面cell
-(NSDictionary *)getFindSetdata{
    dic = [[NSMutableDictionary alloc] init];
    arr1 = [[NSMutableArray alloc] init];
    arr2 = [[NSMutableArray alloc] init];
    arr3 = [[NSMutableArray alloc] init];
    arr4 = [[NSMutableArray alloc] init];
    //却少图片
    FithSetData *data = [[FithSetData alloc] init];
    data.ltTitle = @"消息提示音";
    [arr1 addObject:data];
    
    FithSetData *data1 = [[FithSetData alloc] init];
    data1.ltTitle = @"观看会员音频特效";
    [arr1 addObject:data1];
    
    FithSetData *data2 = [[FithSetData alloc] init];
    data2.ltTitle = @"是否播放视频";
    data2.rtImage = @"arrow1.png";
    [arr1 addObject:data2];
    
    FithSetData *data3 = [[FithSetData alloc] init];
    data3.ltTitle = @"给唱吧打个分，评价一下";
    data3.rtImage = @"arrow1.png";
    [arr2 addObject:data3];
    
    FithSetData *data4 = [[FithSetData alloc] init];
    data4.ltTitle = @"意见反馈";
    data4.rtImage = @"arrow1.png";
    [arr2 addObject:data4];
    
    FithSetData *data5 = [[FithSetData alloc] init];
    data5.ltTitle = @"使用协议和版权声明";
    data5.rtImage = @"arrow1.png";
    [arr2 addObject:data5];
    
    FithSetData *data6 = [[FithSetData alloc] init];
    data6.ltTitle = @"唱吧帮助中心";
    data6.rtImage = @"arrow1.png";
    [arr2 addObject:data6];
    
    FithSetData *data7 = [[FithSetData alloc] init];
    data7.ltTitle = @"关于唱吧";
    data7.rtImage = @"arrow1.png";
    [arr2 addObject:data7];
    FithSetData *data8 = [[FithSetData alloc] init];
    data8.ltTitle = @"清空缓存";
    data8.rtImage = @"arrow1.png";
    [arr3 addObject:data8];
    
    FithSetData *data9 = [[FithSetData alloc] init];
    data9.ltTitle = @"压缩上传";
    [arr4 addObject:data9];
    
    [dic setObject:arr1 forKey:@"arr1"];
    [dic setObject:arr2 forKey:@"arr2"];
    [dic setObject:arr3 forKey:@"arr3"];
    [dic setObject:arr4 forKey:@"arr4"];
    
    return dic;
}

-(NSDictionary *)getFithVipdata{
    dic = [[NSMutableDictionary alloc] init];
    arr1 = [[NSMutableArray alloc] init];
    arr2 = [[NSMutableArray alloc] init];
    arr3 = [[NSMutableArray alloc] init];
    arr4 = [[NSMutableArray alloc] init];

    FithVIPData *data = [[FithVIPData alloc] init];
    data.ltIcon = @"shangbangjilu.png";
    data.rtIcon = @"arrow1.png";
    data.title = @"作品上榜记录";
    [arr1 addObject:data];
    
    FithVIPData *data1 = [[FithVIPData alloc] init];
    data1.ltIcon = @"shuikanguowo.png";
    data1.rtIcon = @"arrow1.png";
    data1.title = @"谁看过我";
    [arr1 addObject:data1];
    
    FithVIPData *data2 = [[FithVIPData alloc] init];
    data2.ltIcon = @"MVmeihua.png";
    data2.rtIcon = @"arrow1.png";
    data2.title = @"MV美化";
    [arr1 addObject:data2];
    
    FithVIPData *data3 = [[FithVIPData alloc] init];
    data3.rtIcon = @"arrow1.png";
    data3.ltIcon = @"huiyuanduihuanzhongxin.png";
    data3.title = @"会员兑换中心";
    [arr1 addObject:data3];
    
    FithVIPData *data4 = [[FithVIPData alloc] init];
    data4.rtIcon = @"arrow1.png";
    data4.ltIcon = @"huiyuanzhuanshuliwu.png";
    data4.title = @"会员专属礼物";
    [arr1 addObject:data4];
    
    FithVIPData *data5 = [[FithVIPData alloc] init];
    data5.rtIcon = @"arrow1.png";
    data5.ltIcon = @"liwugoumaizhekou.png";
    data5.title = @"礼物购买折扣";
    [arr1 addObject:data5];
    
    FithVIPData *data6 = [[FithVIPData alloc] init];
    data6.rtIcon = @"arrow1.png";
    data6.ltIcon = @"geqvzhiding.png";
    data6.title = @"歌曲置顶";
    [arr1 addObject:data6];
    
    FithVIPData *data7 = [[FithVIPData alloc] init];
    data7.rtIcon = @"arrow1.png";
    data7.ltIcon = @"mianfeidaochuzuopin.png";
    data7.title = @"免费导出作品";
    [arr1 addObject:data7];
    
    FithVIPData *data8 = [[FithVIPData alloc] init];
    data8.rtIcon = @"arrow1.png";
    data8.ltIcon = @"lixianshoucanggeqv.png";
    data8.title = @"离线收藏作品";
    [arr1 addObject:data8];
    
    FithVIPData *data9 = [[FithVIPData alloc] init];
    data9.rtIcon = @"arrow1.png";
    data9.ltIcon = @"gexinghuagerenzhuyebeijing.png";
    data9.title = @"个性化个人主页";
    [arr2 addObject:data9];
    
    FithVIPData *data10 = [[FithVIPData alloc] init];
    data10.rtIcon = @"arrow1.png";
    data10.ltIcon = @"yinjianqinxindebofangtexiao.png";
    data10.title = @"一件倾心的播放特效";
    [arr2 addObject:data10];
    
    FithVIPData *data11 = [[FithVIPData alloc] init];
    data11.rtIcon = @"arrow1.png";
    data11.ltIcon = @"hongmingxianshi.png";
    data11.title = @"醒目的红名显示";
    [arr2 addObject:data11];
    
    FithVIPData *data12 = [[FithVIPData alloc] init];
    data12.rtIcon = @"arrow1.png";
    data12.ltIcon = @"dainnaobangerenzhuye.png";
    data12.title = @"电脑版个人主页";
    [arr2 addObject:data12];
    
    FithVIPData *data13 = [[FithVIPData alloc] init];
    data13.rtIcon = @"arrow1.png";
    data13.ltIcon = @"qunzushangxiantisheng.png";
    data13.title = @"群组上限提升";
    [arr3 addObject:data13];
    
    FithVIPData *data14 = [[FithVIPData alloc] init];
    data14.rtIcon = @"arrow1.png";
    data14.ltIcon = @"chuangjianhuiyuanqunzu.png";
    data14.title = @"创建会员群组";
    [arr3 addObject:data14];
    
    FithVIPData *data15 = [[FithVIPData alloc] init];
    data15.rtIcon = @"arrow1.png";
    data15.ltIcon = @"mianfeixianhuashuliangtisheng.png";
    data15.title = @"免费鲜花数量提升";
    [arr3 addObject:data15];
    
    FithVIPData *data16 = [[FithVIPData alloc] init];
    data16.rtIcon = @"arrow1.png";
    data16.ltIcon = @"biaoqingtejia.png";
    data16.title = @"购买表情特价";
    [arr4 addObject:data16];
    
    [dic setObject:arr1 forKey:@"arr1"];
    [dic setObject:arr2 forKey:@"arr2"];
    [dic setObject:arr3 forKey:@"arr3"];
    [dic setObject:arr4 forKey:@"arr4"];
    
    return dic;
}

-(NSDictionary *)getFithGamedata{
    dic = [[NSMutableDictionary alloc] init];
    arr1 = [[NSMutableArray alloc] init];
    
    FithGameData *data = [[FithGameData alloc] init];
    data.ltIcon = @"";
    data.title = @"龙珠三国";
    data.advtitle = @"1元下载送30天唱吧会员";
    [arr1 addObject:data];
    
    FithGameData *data1 = [[FithGameData alloc] init];
    data1.ltIcon = @"";
    data1.title = @"糖果萌萌消";
    data1.advtitle = @"年度最Q弹的消除游戏";
    [arr1 addObject:data1];
    
    FithGameData *data2 = [[FithGameData alloc] init];
    data2.ltIcon = @"";
    data2.title = @"汤姆猫";
    data2.advtitle = @"最萌汤姆猫火爆来袭";
    [arr1 addObject:data2];
    [dic setObject:arr1 forKey:@"arr1"];
    
    
    return dic;
}
@end
