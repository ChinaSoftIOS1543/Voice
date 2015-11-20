//
//  SecCustomCell.m
//  SingPub
//
//  Created by 中软mini005 on 15/11/4.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "SecCustomCell.h"
#import "CustomPeopleImage.h"
#import "EGOImageView.h"
#import "EGOCache.h"

@interface SecCustomCell ()
{
    NSArray * imgURLs;
    EGOImageView *egoImageView;

}



@end

@implementation SecCustomCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    
    _arr=[[NSArray alloc] initWithObjects:
          @"http://jiayahan0223-domain.stor.sinaapp.com/people%2Fpeople%202015-11-19%2013.58.31.png",
          @"http://jiayahan0223-domain.stor.sinaapp.com/people%2Fpeople%202015-11-19%2013.58.40.png",
          @"http://jiayahan0223-domain.stor.sinaapp.com/people%2Fpeople%202015-11-19%2013.59.07.png",
          nil];
    for (int i=0; i<3; i++) {
        egoImageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"Default-568h.png"]];
        egoImageView.frame=CGRectMake(SCREEN_WIDTH/3*i, 0, SCREEN_WIDTH/3-1, 100);
        [self setImageWithURL:[_arr objectAtIndex:i]];
        [self.contentView addSubview:egoImageView];
        UILabel * lable=[[UILabel alloc] initWithFrame:CGRectMake(0, 70, 60, 15)];
        lable.text=@"用户id";
        [egoImageView addSubview:lable];
        UILabel * lable2=[[UILabel alloc] initWithFrame:CGRectMake(0, 85, 60, 15)];
        lable2.text=@"歌名";
        [egoImageView addSubview:lable2];
    }
    

    

}
-(void)updateMyCell
{
    
}

-(void)setImageWithURL:(NSString *)imageURL
{
    [egoImageView setImageURL:[NSURL URLWithString:imageURL]];
    
}
@end
