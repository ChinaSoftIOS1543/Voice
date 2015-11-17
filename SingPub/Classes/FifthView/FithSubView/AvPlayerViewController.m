//
//  AvPlayerViewController.m
//  SingPub
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 中软mini011. All rights reserved.
//

#import "AvPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface AvPlayerViewController ()
{
    UIButton *playbtn;
    UIButton *pausebtn;
    UISlider *slider;
    NSTimer *timer;
    BOOL playing;
}
@property (nonatomic,strong)AVAudioPlayer *player;
@property (nonatomic,strong)NSURL *url;
@property (nonatomic,strong)AVAudioSession *audioSession;
@end



@implementation AvPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    [self.player prepareToPlay];
    playing =NO;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSlider:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 40)];
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    playbtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 50, 50)];
    [playbtn setTitle:@"play" forState:UIControlStateNormal];
    playbtn.tintColor = [UIColor redColor];
    playbtn.tag = 10000;
    playbtn.backgroundColor = [UIColor greenColor];
    [playbtn addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playbtn];
    
    pausebtn = [[UIButton alloc] initWithFrame:CGRectMake(150, 300, 50, 50)];
    [pausebtn setTitle:@"pause" forState:UIControlStateNormal];
    pausebtn.tintColor = [UIColor redColor];
    pausebtn.tag = 10001;
    pausebtn.backgroundColor = [UIColor greenColor];
    [pausebtn addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pausebtn];
    
    
}
-(NSURL *)getFileUrl{
    NSString *urlStr=[[NSBundle mainBundle]pathForResource:@"문을 여시오 (New ver.).mp3" ofType:nil];
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    return url;
}

-(void)btnClick2:(id)sender{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 10000:
            [self.player play];
            playing = YES;
            break;
        case 10001:
            [self.player pause];
            playing = NO;
            break;
        
            
        default:
            break;
    }
    
    
}

-(AVAudioPlayer *)player{
    _url=[self getFileUrl];
    if (_player == nil) {
        NSError *err = nil;
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.url error:&err];
        _audioSession = [AVAudioSession sharedInstance];
        [_audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
        slider.maximumValue = _player.duration;
        
        if (_player && err == nil) {
            [_player prepareToPlay];
        }else{
            NSLog(@"错误");
        }
    }
    return _player;
}
-(void)updateSlider:(id)sender{
    slider.value = _player.currentTime;
    if (slider.value == slider.maximumValue) {
        [_player setCurrentTime:slider.minimumValue];
    }
    if (playing) {
        [_player play];
    }
}

-(IBAction)sliderChange:(id)sender{
    [_player stop];
    [_player setCurrentTime:slider.value];
    [_player prepareToPlay];
    if (playing) {
        [_player play];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
