//
//  AvPlayerViewController.m
//  SingPub
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "AvPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface AvPlayerViewController ()<AVAudioPlayerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView* rootImageView;
    
    AVAudioPlayer* _audioPlayer;
    NSMutableArray* _pNames;
    NSMutableArray* _hNames;
    
    int _songIndex;
    UIButton* leftButton;
    UIButton* rightButton;
    
    UILabel* _label;
    UISlider* _slider;
    UISlider* _volumeSlider;
    NSTimer* processTimer;
    NSTimer* timer1;
}
@property (nonatomic,strong)AVAudioPlayer *player;
@property (nonatomic,strong)NSURL *url;
@property (nonatomic,strong)AVAudioSession *audioSession;
@end

@implementation AvPlayerViewController

static AvPlayerViewController *avplayerviewcontroller = nil;

+(AvPlayerViewController *) sharedController{
    
    @synchronized(self)
    {
        if (avplayerviewcontroller == nil)
        {
            avplayerviewcontroller = [[self alloc] init];
        }
    }
    return avplayerviewcontroller;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performSelector:@selector(dataInit)];
    [self performSelector:@selector(viewInit)];
}
-(void)dataInit
{
    _pNames =[[NSMutableArray alloc] initWithCapacity:0];
    [_pNames addObject:@"Ironforge.mp3"];
    [_pNames addObject:@"Orgrimmar.mp3"];
    [_pNames addObject:@"The Burning Legion.mp3"];
    [_pNames addObject:@"魔兽世界 - 游戏 原声.mp3"];
    
    
    _hNames= [[NSMutableArray alloc] initWithCapacity:0];
    [_hNames addObject:@"Ironforge.mp3"];
    [_hNames addObject:@"Orgrimmar.mp3"];
    [_hNames addObject:@"The Burning Legion.mp3"];
    [_hNames addObject:@"魔兽世界 - 游戏 原声.mp3"];
    _songIndex=0;
}

-(void)viewInit
{
    self.navigationController.navigationBar.alpha = 0.5f;
    rootImageView= [[UIImageView alloc] initWithFrame: [UIScreen mainScreen].bounds];
    rootImageView.image= [UIImage imageNamed:@"sea.png"];
    [self.view addSubview:rootImageView];
    
    UIButton* button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(130, 300, 60, 50);
    //[button setTitle:@"播放" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    
    
    button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(50, 300, 60, 50);
    //[button setTitle:@"上一首" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(prier) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
    leftButton=button;
    
    [self.view addSubview:button];
    
    button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(210, 300, 60, 50);
    //[button setTitle:@"下一首" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"right.png"] forState:UIControlStateNormal];
    rightButton=button;
    [self.view addSubview:button];
    
    button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(10, 400, 40, 40);
    //[button setTitle:@"音量" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"labalan.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showVolume) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(270, 400, 40, 40);
    //[button setTitle:@"背景" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"apple.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(setBackground) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIImageView* musicImageView= [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"musicLogo.png"]];
    musicImageView.frame= CGRectMake(80, 100, 160, 140);
    [self.view addSubview:musicImageView];
    
    _label= [[UILabel alloc] initWithFrame:CGRectMake(0, 245, 320, 30)];
    _label.font= [UIFont systemFontOfSize:25];
    _label.textAlignment= UITextAlignmentCenter;
    _label.textColor= [UIColor blueColor];
    _label.numberOfLines=0;
    _label.backgroundColor= [UIColor clearColor];
    _label.text= [_hNames objectAtIndex:0];
    [self.view addSubview:_label];
    
    _slider= [[UISlider alloc] initWithFrame:CGRectMake(50, 270, 220, 5)];
    _slider.maximumValue=100;
    _slider.minimumValue=0;
    _slider.value=0;
    _slider.continuous=NO;
    //[_slider setThumbImage:[UIImage imageNamed:@"snow.png"] forState:UIControlStateNormal];
    [_slider addTarget:self action:@selector(processSet:) forControlEvents:UIControlEventValueChanged];
    [_slider addTarget:self action:@selector(processTimerStop) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview: _slider];
    
    _volumeSlider= [[UISlider alloc] initWithFrame:CGRectMake(-85, 280, 220, 5)];
    _volumeSlider.maximumValue=1;
    _volumeSlider.minimumValue=0;
    _volumeSlider.value= 0.5;
    _volumeSlider.hidden=YES;
    [_volumeSlider addTarget:self action:@selector(volumeSet:) forControlEvents:UIControlEventValueChanged];
    _volumeSlider.transform= CGAffineTransformMakeRotation(-90* M_PI/180);
    [self.view addSubview:_volumeSlider];
    
    processTimer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(process) userInfo:nil repeats:YES];
    
    
    
    [self loadMusic:[_pNames objectAtIndex:0] type:nil];
    
    
    UILongPressGestureRecognizer* rightLongPress= [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(rightLongPress:)];
    [rightButton addGestureRecognizer:rightLongPress];
    
    UILongPressGestureRecognizer* leftLongPress= [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(leftLongPress:)];
    [leftButton addGestureRecognizer:leftLongPress];
   
    
    
}
-(void)processSet:(UISlider*)slider
{
    
    processTimer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(process) userInfo:nil repeats:YES];
    _audioPlayer.currentTime=slider.value/100*_audioPlayer.duration;
    if(_audioPlayer.playing==YES)
        [_audioPlayer playAtTime:_audioPlayer.currentTime];
}
-(void)processTimerStop
{
    [processTimer invalidate];
}
-(void)rightLongPress:(UILongPressGestureRecognizer*)longPress
{
    if (longPress.state != UIGestureRecognizerStateBegan)
        return;
    
    
    if(_audioPlayer.playing)
    {
        if(_audioPlayer.currentTime>_audioPlayer.duration-5)
            _audioPlayer.currentTime=_audioPlayer.currentTime;
        else
            _audioPlayer.currentTime+=5;
        
        [_audioPlayer playAtTime:_audioPlayer.currentTime];
        
        
    }
}

-(void)leftLongPress:(UILongPressGestureRecognizer*)longPress
{
    if (longPress.state != UIGestureRecognizerStateBegan)
        return;
    
    
    if(_audioPlayer.playing)
    {
        if(_audioPlayer.currentTime<5)
            _audioPlayer.currentTime=0;
        else
            _audioPlayer.currentTime-=5;
        
        [_audioPlayer playAtTime:_audioPlayer.currentTime];
        
        printf("left\n");
    }
    
}
//雪花函数
-(void)snow
{
    int startX= random()%320;
    int endX= random()%320;
    int width= random()%25;
    CGFloat time= (random()%100)/10+5;
    CGFloat alp= (random()%9)/10.0+0.1;
    
    //    CGFloat red= (random()%10)/10.0;
    //    CGFloat green= (random()%10)/10.0;
    //    CGFloat blue= (random()%10)/10.0;
    
    UIImage* image= [UIImage imageNamed:@"snow.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    //    imageView.backgroundColor= [UIColor colorWithRed:red green:green blue:blue alpha:1];
    imageView.frame= CGRectMake(startX,-1*width,width,width);
    imageView.alpha=alp;
    
    [self.view addSubview:imageView];
    
    
    [UIView beginAnimations:nil context:(__bridge void * _Nullable)(imageView)];
    [UIView setAnimationDuration:time];
    
    if(endX>50&&endX<270)
    {
        imageView.frame= CGRectMake(endX, 270-width/2, width, width);
        
    }
    else if((endX>10&&endX<50)||(endX>270&&endX<310))
        imageView.frame= CGRectMake(endX, 400-width/2, width, width);
    else
        imageView.frame= CGRectMake(endX, 480, width, width);
    [UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    
}
-(void)onAnimationComplete:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context
{
    UIImageView* snowView=(__bridge UIImageView *)(context);
    [snowView removeFromSuperview];
    
}

//封装系统加载函数
-(void)loadMusic:(NSString*)name type:(NSString*)type
{
    NSString *urlStr=[[NSBundle mainBundle]pathForResource:name ofType:nil];
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    _audioPlayer= [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    _audioPlayer.delegate=self;
    _audioPlayer.volume= 0.5;
    [_audioPlayer prepareToPlay];
    
}
//播放完成自动切换
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
    _songIndex++;
    if(_songIndex==_pNames.count)
        _songIndex= 0;
    
    
    
    [self loadMusic:[_pNames objectAtIndex:_songIndex] type:nil];
    _label.text= [_hNames objectAtIndex:_songIndex];
    [_audioPlayer play];
    
    
    
}
//音量设置
-(void)volumeSet:(UISlider*)slider
{
    _audioPlayer.volume= slider.value;
}
-(void)showVolume
{
    
    _volumeSlider.hidden=NO;
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(hideVolume) userInfo:nil repeats:NO];
}
-(void)hideVolume
{
    _volumeSlider.hidden=YES;
}
//歌曲进度
-(void)process
{
    
    _slider.value= 100*_audioPlayer.currentTime/_audioPlayer.duration;
}
//播放
-(void)play:(UIButton*)button
{
    
    if(_audioPlayer.playing)
    {
        [button setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [_audioPlayer pause];
        [timer1 invalidate];
    }
    
    else
    {
        [button setImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
        timer1=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(snow) userInfo:nil repeats:YES];
        [_audioPlayer play];
    }
    
}
//上一首
-(void)prier
{
    BOOL playFlag;
    if(_audioPlayer.playing)
    {
        playFlag=YES;
        [_audioPlayer stop];
    }
    else
    {
        playFlag=NO;
    }
    
    _songIndex--;
    if(_songIndex<0)
        _songIndex= _pNames.count-1
        ;
    
    
    
    [self loadMusic:[_pNames objectAtIndex:_songIndex] type:nil];
    _label.text= [_hNames objectAtIndex:_songIndex];
    
    if(playFlag==YES)
    {
        [_audioPlayer play];
        
    }
    
}
//下一首
-(void)next
{
    BOOL playFlag;
    if(_audioPlayer.playing)
    {
        playFlag=YES;
        [_audioPlayer stop];
    }
    else
        playFlag=NO;
    
    _songIndex++;
    if(_songIndex==_pNames.count)
        _songIndex= 0;
    
    
    
    [self loadMusic:[_pNames objectAtIndex:_songIndex] type:nil];
    _label.text= [_hNames objectAtIndex:_songIndex];
    if(playFlag==YES)
    {
        [_audioPlayer play];
        
    }
    
}
//背景
-(void)setBackground
{
    UIImagePickerController* picker= [[UIImagePickerController alloc] init];
    picker.sourceType= UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    picker.delegate=self;
    [self presentModalViewController:picker animated:YES];
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    rootImageView.image = image;
    [self dismissModalViewControllerAnimated:YES];
}

@end
