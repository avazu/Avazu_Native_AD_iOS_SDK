//  AvazuSampleDetailPortraitViewController.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/4.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "AvazuSampleDetailPortraitViewController.h"
#import "AppDelegate.h"

@interface AvazuSampleDetailPortraitViewController ()

@property (nonatomic, strong) UIImageView *singleBannerPictureUpView;
@property (nonatomic, strong) UIImageView *singleBannerPicturedownView;
@property (nonatomic, strong) UIImageView *bannerWallPictureUpView;
@property (nonatomic, strong) UIImageView *bannerWallPictureDownView;
@property (nonatomic, strong) UIImageView *singlebuttonAppPictureUpView;
@property (nonatomic, strong) UIImageView *singlebuttonAppPictureDownView;
@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;

@end

@implementation AvazuSampleDetailPortraitViewController

@synthesize detailItem;
@synthesize adView;
@synthesize screenWidth;
@synthesize screenHeight;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
    }
}

-(void)loadAdRequest
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Single_Banner"]) {
            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);

            UIImage* playerIdle = [UIImage imageNamed:@"image_up2.jpg"];

            _singleBannerPictureUpView = [[UIImageView alloc]initWithFrame:(CGRectZero)];

            _singleBannerPictureUpView.frame = CGRectMake(0, 66, screenWidth, screenHeight*0.75);

            [_singleBannerPictureUpView setImage: playerIdle];

            [self.view addSubview:_singleBannerPictureUpView];

            //create a single banner adview start
            CGRect adFrame = CGRectMake(0, screenHeight*0.75 + 66, screenWidth, adSize.height);

            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_SINGLE_BANNER
                                               sourceID:@"15587"];
            adView.delegate = self;
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a single banner adview end

            UIImage* playerIdle2 = [UIImage imageNamed:@"image_down2.jpg"];

            _singleBannerPicturedownView = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight*0.75+ 66 + adSize.height, screenWidth, screenHeight - screenHeight*0.75 - adSize.height)];
            [_singleBannerPicturedownView setImage: playerIdle2];
            [self.view addSubview:_singleBannerPicturedownView];
        }
        else if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Banner_Wall"]) {

            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);
            CGRect viewFrame = self.view.frame;

            UIImage* bannerWallPictureUp = [UIImage imageNamed:@"image_up1.jpg"];

            _bannerWallPictureUpView = [[UIImageView alloc]initWithFrame:(CGRectZero)];

            _bannerWallPictureUpView.frame = CGRectMake(0, 66, screenWidth, screenHeight*0.5);

            [_bannerWallPictureUpView setImage: bannerWallPictureUp];

            [self.view addSubview:_bannerWallPictureUpView];

            //create a banner app wall adview start
            CGRect adFrame = CGRectMake((viewFrame.size.width - adSize.width) / 2, screenHeight*0.5 + 66, screenWidth, 200);

            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_BANNER_APPWALL
                                               sourceID:@"15587"];
            adView.appCount = 2;
            adView.delegate = self;
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a banner app wall adview end

            UIImage* bannerWallPictureDown = [UIImage imageNamed:@"image_down1.jpg"];
            _bannerWallPictureDownView = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight*0.5 + 66 + 200, screenWidth, screenHeight - screenHeight*0.5- 200)];
            [_bannerWallPictureDownView setImage: bannerWallPictureDown];
            [self.view addSubview:_bannerWallPictureDownView];

        }
        else if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Single_RECT"]) {
            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);
            CGRect viewFrame = self.view.frame;

            UIImage* singlebuttonAppPictureUp = [UIImage imageNamed:@"image_up1.jpg"];

            _singlebuttonAppPictureUpView = [[UIImageView alloc]initWithFrame:(CGRectZero)];

            _singlebuttonAppPictureUpView.frame = CGRectMake(0, 66, screenWidth, screenHeight*0.5);

            [_singlebuttonAppPictureUpView setImage: singlebuttonAppPictureUp];

            [self.view addSubview:_singlebuttonAppPictureUpView];

            //create a single line button app wall adview start
            CGRect adFrame = CGRectMake((viewFrame.size.width - adSize.width) / 2, screenHeight*0.5 + 66, screenWidth, 240);

            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_SINGLE_BUTTON_APP_WALL
                                               sourceID:@"15587"];
            //setting app count and customize adview
            adView.appCount = 6;
            adView.isNeedReviewNumber = 0;
            adView.isNeedSize = 0;
            adView.delegate = self;
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a single line button app wall adview end
            UIImage* singlebuttonAppPictureDown = [UIImage imageNamed:@"image_down1.jpg"];
            _bannerWallPictureDownView = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight*0.5 + 66 + 240, screenWidth, screenHeight - screenHeight*0.5- 240)];
            [_bannerWallPictureDownView setImage: singlebuttonAppPictureDown];
            [self.view addSubview:_bannerWallPictureDownView];
        }
    }
}

- (void)configureView
{
    if(adView) {
        adView.hidden = YES;
        [adView removeFromSuperview];
        adView = nil;
    }
    screenHeight = [UIScreen mainScreen].applicationFrame.size.height;
    screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    [self loadAdRequest];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Avazu iOS SDK", @"Avazu iOS SDK");
    }
    return self;
}

#pragma avazuADViewDelegate

- (void)avazuADViewLoadAdSucess:(AvazuADView *)adview
{
    NSLog(@"avazuADViewLoadAdSucess");
}
- (void)avazuADView:(AvazuADView *)adview didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"avazuADViewLoadAdFail");
    NSLog(@"error:%@", error);
}

#pragma dealloc
-(void)dealloc {
    self.adView.delegate = nil;
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end
