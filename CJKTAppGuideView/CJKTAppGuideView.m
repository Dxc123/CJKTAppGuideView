//
//  CJKTGuideView.m
//  CJKTGuideView
//
//  Created by Dxc_iOS on 2018/9/28.
//  Copyright © 2018年 超级课堂. All rights reserved.
//

#import "CJKTAppGuideView.h"
#import "UIView+FrameExtension.h"
#import <AVKit/AVKit.h>


@interface CJKTAppGuideView()<UIScrollViewDelegate>


@property (nonatomic, strong) UIImageView *toolView;

@property (nonatomic, strong) UIScrollView *pageScrollView;

@property (nonatomic, strong) NSArray *imageNameArray;//图片数组

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UIButton *loginBtn;//登录按钮

@property (nonatomic, strong) UIButton *registerBtn;//注册按钮

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, strong) UIButton *skipButton;//跳过按钮

@property (nonatomic, strong) AVPlayerViewController *playerController;
@property (nonatomic, strong)  NSURL *videoURL;
@end

@implementation CJKTAppGuideView

// MARK:图片引导页

- (instancetype)initWithFrame:(CGRect)frame imageNameArray:(NSArray<NSString *> *)imageNameArray{
    
    if(self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor whiteColor];
        
        self.imageNameArray = imageNameArray;
      
 // 设置引导视图的scrollview
        [self addSubview:self.pageScrollView];
        
//// 设置引导页上的页面控制器(小圆点)
        [self addSubview:self.pageControl];
        
        self.pageControl.frame_top = kSCREENH_HEIGHT-100;
        self.pageControl.frame_centerX = frame.size.width / 2;
        
// 添加引导页上的跳过按钮
         [self addSubview:self.skipButton];
        
    
// 添加在引导视图上的多张引导图片
        [self setUpPageContentView];
        
// 添加toolView
        [self addSubview:self.toolView];
        self.toolView.frame_bottom = frame.size.height;
        self.toolView.frame_left = 0;
    
// 添加loginBtn
        [self.toolView addSubview:self.loginBtn];
        self.loginBtn.frame_left = 34.5f ;
        self.loginBtn.frame_bottom = self.toolView.frame_height - 25.5f;
        [self.loginBtn addTarget:self action:@selector(goLogin) forControlEvents:UIControlEventTouchUpInside];
        
// 添加registerBtn
        [self.toolView addSubview:self.registerBtn];
        self.registerBtn.frame_right = self.toolView.frame_width - 34.5f ;
        self.registerBtn.frame_bottom = self.loginBtn.frame_bottom;
        [self.registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
        
    
        
    }
    
    return self;
    
}

// MARK: UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger currentPage = scrollView.contentOffset.x / kSCREEN_WIDTH;
    
    self.currentPage = currentPage;
    
    self.pageControl.currentPage = currentPage;
}


// MARK: 点击事件
- (void)goLogin {
    
    [self removeFromSuperview];
    
    if(self.goLoginAction) {
        NSLog(@"登录");
        self.goLoginAction();
        
    }
    
}

- (void)registerAction {
    
    [self removeFromSuperview];
    
    if(self.goRegisterAction) {
        NSLog(@"注册");
        self.goRegisterAction();
        
    }
    
}

- (void)buttonClick:(UIButton *)button {
    [UIView animateWithDuration:2.0 animations:^{
        self.alpha = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self performSelector:@selector(removeGuidePageHUD) withObject:nil afterDelay:1];
        });
    }];
}

- (void)removeGuidePageHUD {
    [self removeFromSuperview];
}

- (void)setUpPageContentView {

    for (NSInteger i = 0; i <self.imageNameArray.count; i++) {
    
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageNameArray[i]]];
       
        imageView.frame = CGRectMake(i  * kSCREEN_WIDTH, 0, kSCREEN_WIDTH, kSCREENH_HEIGHT);
        [self.pageScrollView addSubview:imageView];
        
    
        // 设置在最后一张图片上显示进入体验按钮
        if (i == self.imageNameArray.count-1 ) {
            [imageView setUserInteractionEnabled:YES];
            UIButton *startButton = [[UIButton alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH*0.3, CGRectGetMidY(self.pageControl.frame)-60, kSCREEN_WIDTH*0.4, 44)];
            [startButton setTitle:@"开始体验" forState:UIControlStateNormal];
            [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [startButton.titleLabel setFont:[UIFont systemFontOfSize:21]];
            [startButton setBackgroundColor:[UIColor grayColor]];
            startButton.layer.cornerRadius = 6.25f;
            [startButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:startButton];
        }
    }
    
    self.pageScrollView.contentSize = CGSizeMake(kSCREEN_WIDTH*self.imageNameArray.count, 0);
    
}

- (UIPageControl *)pageControl {
    
    if(!_pageControl) {
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = self.imageNameArray.count;
        _pageControl.frame_width = 60;
        _pageControl.frame_height = 30;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        
    }
    
    return _pageControl;
    
}

- (UIScrollView *)pageScrollView {
    
    if(!_pageScrollView) {
        
        _pageScrollView = [[UIScrollView alloc] init];
        _pageScrollView.frame_width = kSCREEN_WIDTH;
        _pageScrollView.frame_height = kSCREENH_HEIGHT;
        _pageScrollView.frame_left = 0;
        _pageScrollView.frame_top = 0;
        _pageScrollView.pagingEnabled = YES;
        _pageScrollView.bounces = NO;
        _pageScrollView.showsHorizontalScrollIndicator = NO;
        _pageScrollView.showsVerticalScrollIndicator = NO;
        _pageScrollView.delegate = self;
        
    }
    
    return _pageScrollView;
    
}

- (UIImageView *)toolView {
    
    if(!_toolView) {
        
        _toolView = [[UIImageView alloc] init];
        _toolView.frame_width = kSCREEN_WIDTH;
        _toolView.frame_height = 80.0f ;
//        _toolView.image = [UIImage imageNamed:@"appGuide_bottom"];
        _toolView.userInteractionEnabled = YES;

        
    }
    
    return _toolView;
    
}

- (UIButton *)skipButton {
    
    if(!_skipButton) {
        
        _skipButton = [[UIButton alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH*0.8, kSCREEN_WIDTH*0.1, 60, 40)];
        [_skipButton setTitle:@"跳过" forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _skipButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_skipButton setBackgroundColor:[UIColor grayColor]];
        [_skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_skipButton.layer setCornerRadius:(_skipButton.frame.size.height * 0.5)];
        [_skipButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return _skipButton;
}

- (UIButton *)loginBtn {
    
    if(!_loginBtn) {
        
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.layer.borderWidth = 1.0f;
        _loginBtn.layer.borderColor = [UIColor blackColor].CGColor;
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loginBtn.backgroundColor = [UIColor grayColor];
        _loginBtn.frame_height = 44.0f;
        _loginBtn.frame_width = 136.0f ;
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
        _loginBtn.layer.cornerRadius = 6.25f;
        
    }
    
    return _loginBtn;
    
}

- (UIButton *)registerBtn {
    
    if(!_registerBtn) {
        
        _registerBtn = [[UIButton alloc] init];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.layer.borderWidth = 1.0f;
        _registerBtn.layer.borderColor = [UIColor blackColor].CGColor;
        [_registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _registerBtn.frame_height = 44.0f;
        _registerBtn.frame_width = 136.0f ;
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
        _registerBtn.layer.cornerRadius = 6.25f;
        
    }
    
    return _registerBtn;
    
}



// MARK: 视频引导页
- (instancetype)initWithFrame:(CGRect)frame videoURL:(NSURL *)videoURL{
    self = [super initWithFrame:frame];
    if (self) {
        self.videoURL = videoURL;
        [self setupVideoUI];
    }
    return self;
}

-(void)setupVideoUI{
    [self addSubview:self.playerController.view];
    [_playerController.player play];
    
    // 跳过按钮
    
    [self addSubview:self.skipButton];
    
   // 开始体验按钮
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(20, kSCREENH_HEIGHT-30-40, kSCREEN_WIDTH-40, 40)];
    [startButton.layer setBorderWidth:1.0];
    [startButton.layer setCornerRadius:20.0];
    [startButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [startButton setTitle:@"开始体验" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton setAlpha:0.0];
    [self addSubview:startButton];
    [startButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:2.0f animations:^{
        [startButton setAlpha:1.0];
    }];

    
    //注册通知 播放完成 和从后台切换到前台  进入主界面
    //完成
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification  object:nil];
    //后台->前台
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name: UIApplicationWillEnterForegroundNotification  object:nil];

    
  
    
}
//已经停止画中画时调用的方法
- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController{
    
}

-(AVPlayerViewController *)playerController{
    if (!_playerController) {
        _playerController = [[AVPlayerViewController alloc] init];
         _playerController.view.frame = CGRectMake(0, 0, kSCREEN_WIDTH,kSCREENH_HEIGHT );
        _playerController.player = [[AVPlayer alloc] initWithURL:self.videoURL];
        _playerController.videoGravity = AVLayerVideoGravityResizeAspectFill;// 试图的填充模式
        _playerController.showsPlaybackControls = NO; //是否显示播放控制。 默认为YES
        _playerController.entersFullScreenWhenPlaybackBegins = YES;//当播放按钮被点击时，是否自动进入全屏。 默认为NO
        _playerController.exitsFullScreenWhenPlaybackEnds = YES;//当播放完后，是否自动退出全屏。 默认为NO
       
    }
    return _playerController;
}
//通知事件
- (void)playbackFinished:(NSNotification *)notifation {
//    // 回到视频的播放起点 -> 播放
//    [self.playerController.player seekToTime:kCMTimeZero];
//    [self.playerController.player play];
     [self removeFromSuperview];
}
//移除播放完成与切换通知
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
