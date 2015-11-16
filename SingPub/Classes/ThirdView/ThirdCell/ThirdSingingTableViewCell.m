//
//  ThirdSingingTableViewCell.m
//  SingPub
//
//  Created by 中软mini011 on 15/11/6.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "ThirdSingingTableViewCell.h"

@interface ThirdSingingTableViewCell ()
{
    UIView * _bgView;
    
    UIImageView * _frontImageView;
    
    UILabel * _label1;
    
    UILabel * _label2;
    
//    UIImageView * _leftImageView;
//    
//    UIImageView * _rightImageView;
//    
//    UILabel * _leftLabel;
//    
//    UILabel * _rightLabel;
    
    UIButton * _singButton;
    
}

@end
@implementation ThirdSingingTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //CELL的风格
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        
        [self initCell];
    }
    
    return self;
}

-(void)initCell
{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 65)];
    
    _bgView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:_bgView];
    
    _frontImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 51, 51)];
    _frontImageView.backgroundColor = [UIColor clearColor];
    
    [_bgView addSubview:_frontImageView];
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_frontImageView.frame)+8, 10, 170, 28)];
    
    _label1.font = [UIFont systemFontOfSize:16];
    
    _label1.backgroundColor = [UIColor clearColor];
    
    [_bgView addSubview:_label1];
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_frontImageView.frame)+8, CGRectGetMaxY(_label1.frame), 170, 20)];
    
    _label2.backgroundColor = [UIColor clearColor];
    
    _label2.font = [UIFont systemFontOfSize:14];
    
    [_bgView addSubview:_label2];
    
    _singButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-70, 15, 59, 34)];
    
    _singButton.backgroundColor = [UIColor whiteColor];
    
    [_singButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    _singButton.layer.cornerRadius = 17.5f;
    
    _singButton.layer.borderWidth = 1.5;
    
    _singButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    [_singButton addTarget:self action:@selector(singButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [_bgView addSubview:_singButton];
    
//    UIView * bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
//    
//    [self.contentView addSubview:bgView2];
//    
//    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 0, SCREEN_WIDTH/2-2, 80)];
//    
//    _leftImageView.backgroundColor = [UIColor yellowColor];
//    [_bgView addSubview:_leftImageView];
//
//    
//    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftImageView.frame)+2, 0, SCREEN_WIDTH/2-2, 80)];
//    
//    _rightImageView.backgroundColor = [UIColor greenColor];
//    [_bgView addSubview:_rightImageView];
//    
//    _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(1, CGRectGetMaxY(_leftImageView.frame), SCREEN_WIDTH/2-2, 20)];
//    
//    _leftLabel.backgroundColor = [UIColor blackColor];
//    
//    [_bgView addSubview:_leftLabel];
//    _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_leftLabel.frame)+2, CGRectGetMaxY(_rightImageView.frame), SCREEN_WIDTH/2-2, 20)];
//    
//   _rightLabel.backgroundColor = [UIColor blackColor];
//    [_bgView addSubview:_rightLabel];

    
}



-(void)singButtonClicked:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(ThirdSingingCellClickedWithImageView)])
    {
        [_delegate ThirdSingingCellClickedWithImageView];
    }
}

-(void)updateSingingCell
{
    _frontImageView.image = [UIImage imageNamed:_Data._frontImageName];
    
    _label1.text = _Data._label1Name;
    
    _label2.text = _Data._label2Name;
    
    [_singButton setTitle:_Data._singButtonName forState:UIControlStateNormal];
    
//    _leftImageView.image = [UIImage imageNamed:_Data._leftImageName];
//    
//    _rightImageView.image = [UIImage imageNamed:_Data._rightImageName];
    
//    _leftLabel.text = _Data._leftLabelName;
//    
//    _rightLabel.text = _Data._rightLabelName;
    
    
}



















@end
