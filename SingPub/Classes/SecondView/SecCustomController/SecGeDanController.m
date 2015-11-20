//
//  SecGeDanController.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/11.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecGeDanController.h"
#import "EGOImageView.h"
#import "EGOCache.h"


@interface SecGeDanController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * imgURLs;
    EGOImageView *egoImageView;
}

@end

@implementation SecGeDanController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[EGOCache currentCache] clearCache];
    self.view.backgroundColor=[UIColor whiteColor];
    imgURLs=[[NSArray alloc] initWithObjects:
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2Fc925fc05b3da803ea83ee24fc17c6803.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2F58590f7451b208c57bad43bddbfe4888.jpg.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2F2ad9a0d32837b0c7a98cd9475f3f8364.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2Fc925fc05b3da803ea83ee24fc17c6803.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2Fc925fc05b3da803ea83ee24fc17c6803.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2F2ad9a0d32837b0c7a98cd9475f3f8364.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2F58590f7451b208c57bad43bddbfe4888.jpg.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2Fc925fc05b3da803ea83ee24fc17c6803.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2F2ad9a0d32837b0c7a98cd9475f3f8364.png",
             @"http://jiayahan0223-domain.stor.sinaapp.com/image%2Fc925fc05b3da803ea83ee24fc17c6803.png",
             nil];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initUI];
}
-(void)initUI
{
    UITableView * table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    table.dataSource=self;
    table.delegate=self;
    table.rowHeight=80;
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self.view addSubview:table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cellName";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    //[self getImage];
    
    egoImageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"Default-568h.png"]];
    egoImageView.frame=CGRectMake(0, 0, SCREEN_WIDTH, 80);
//    UIImageView * image=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
//    image.image=[UIImage imageNamed:@"Default-568h.png"];
    UILabel * leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 60, SCREEN_WIDTH/2, 20)];
    leftLabel.text=@"歌单名";
    leftLabel.textAlignment=NSTextAlignmentLeft;
    
    UILabel * rightLabel=[[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 60, SCREEN_WIDTH/2-20, 20)];
    rightLabel.text=@"12344";
    rightLabel.textAlignment=NSTextAlignmentRight;
    
    cell.backgroundView=egoImageView;
    [self setImageWithURL:[imgURLs objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:rightLabel];
    [cell.contentView addSubview:leftLabel];
    
    return cell;
}
-(void)setImageWithURL:(NSString *)imageURL
{
    [egoImageView setImageURL:[NSURL URLWithString:imageURL]];
    
}

@end
