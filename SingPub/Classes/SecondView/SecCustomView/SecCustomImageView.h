//
//  SecCustomImageView.h
//  SingPub
//
//  Created by 中软mini005 on 15/11/3.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecCustomImageData.h"

@protocol SecCustomImageViewDelegate <NSObject>

-(void)ImageViewDelegateClick:(id)sender;

@end

@interface SecCustomImageView : UIView

@property(nonatomic,strong) SecCustomImageData * data;
@property (nonatomic ,weak)id<SecCustomImageViewDelegate> delegate;

@property(nonatomic, assign)int imageTag;
-(void)updateImage;

@end
