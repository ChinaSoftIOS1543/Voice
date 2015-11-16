//
//  ThirdAccomplishSongView.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/10.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdAccomplishSongView.h"

@interface ThirdAccomplishSongView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
}

@end

@implementation ThirdAccomplishSongView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initTableView];
    }
    
    return self;
}

-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.showsHorizontalScrollIndicator = NO;
    
    _tableView.showsVerticalScrollIndicator = NO;
    
    
    [self addSubview:_tableView];
}

#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellType = @"cellType";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellType];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellType];
    }
    return cell;
}

#pragma mark- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
