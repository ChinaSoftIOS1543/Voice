//
//  SecHeChangController.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/14.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecHeChangController.h"
#import "SecCustomHeChangCell.h"

@interface SecHeChangController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SecHeChangController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"精彩合唱";
    self.view.backgroundColor=[UIColor whiteColor];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initUI];
}
//-(void)initUI
//{
//    UITableView * table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
//    table.dataSource=self;
//    table.delegate=self;
//    table.estimatedRowHeight=50.0f;
//    table.rowHeight=UITableViewAutomaticDimension;
//    table.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:table];
//    
//}
//
//#pragma make- tableDeldgate
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//{
//    return 2;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString * cellName=@"cellName";
//    SecCustomHeChangCell * cell=[tableView dequeueReusableCellWithIdentifier:cellName];
//    if (cell==nil) {
//        cell=[[SecCustomHeChangCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellName"];
//    }
//    return cell;
//}
-(void)initUI
{
    UITableView * table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    table.backgroundColor=[UIColor orangeColor];
    table.delegate=self;
    table.dataSource=self;
    table.estimatedRowHeight=20.0f;
    table.rowHeight=UITableViewAutomaticDimension;
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self.view addSubview:table];
}

#pragma make - TableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName=@"cellName";
    SecCustomHeChangCell *cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[SecCustomHeChangCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    
    return cell;
}

@end
