//
//  AvazuCustomizedADSettingViewController.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/23.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "AvazuSampleDetailLandscapeViewCtroller.h"
#import "AppDelegate.h"

@interface AvazuSampleDetailLandscapeViewCtroller ()

@property (nonatomic, strong) UIImageView *transparentBannerPicView;
@property (nonatomic, strong) UIImageView *multiplebuttonAppWallPicView;
@property (nonatomic, assign) CGFloat landscapeFullscreenHeight;
@property (nonatomic, assign) CGFloat landscapeFullscreenWidth;

@end

@implementation AvazuSampleDetailLandscapeViewCtroller

@synthesize detailItem;
@synthesize adView;
@synthesize landscapeFullscreenHeight;
@synthesize landscapeFullscreenWidth;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
    }
}

-(void)loadAdRequest
{
    if (self.detailItem) {
        if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Transparent_Banner"]) {            
            UIImage* transparentBannerPicture = [UIImage imageNamed:@"3dgames-background.jpg"];
            _transparentBannerPicView = [[UIImageView alloc]initWithFrame:(CGRectZero)];
            
            _transparentBannerPicView.frame = CGRectMake(0, 22, landscapeFullscreenWidth, landscapeFullscreenHeight);
            
            [_transparentBannerPicView setImage: transparentBannerPicture];
            
            [self.view addSubview:_transparentBannerPicView];
            
            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);
            //create a transparent adview start
            CGRect adFrame = CGRectMake((landscapeFullscreenWidth - adSize.width) / 2, landscapeFullscreenHeight * 0.65, adSize.width, adSize.height);
            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_TRANSPARENT_SINGLE_BANNER
                                               sourceID:@"15587"];
            adView.isNeedSize = 0;
            adView.isDebug = 1;
            adView.delegate = self;
            adView.transparentBannerAlpha = 50;
            adView.mainBackColor  = @"#000000";
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a transparent adview end
        }
        
        else if([[self.detailItem objectForKey:@"type"] isEqualToString:@"App_Wall"]) {
            
            UIImage* multiplebuttonAppWallPicture = [UIImage imageNamed:@"image_left1.jpg"];
            _multiplebuttonAppWallPicView = [[UIImageView alloc]initWithFrame:(CGRectZero)];
            
            _multiplebuttonAppWallPicView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height, landscapeFullscreenWidth*0.6, landscapeFullscreenHeight - self.navigationController.navigationBar.frame.size.height);
            [_multiplebuttonAppWallPicView setImage: multiplebuttonAppWallPicture];
            
            [self.view addSubview:_multiplebuttonAppWallPicView];
            
            //create a multiple line button app wall adview start
            CGRect adFrame = CGRectMake(landscapeFullscreenWidth*0.6, self.navigationController.navigationBar.frame.size.height, landscapeFullscreenWidth * 0.4 , landscapeFullscreenHeight - self.navigationController.navigationBar.frame.size.height);
            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_MULTIPLE_BUTTON_APP_WALL
                                               sourceID:@"15587"];
            adView.appCount = 6;
            adView.delegate = self;
            adView.isNeedReviewNumber = 0;
            adView.isNeedSize = 0;
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
                //create a multiple line button app wall adview end
            }
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
    landscapeFullscreenHeight = [UIScreen mainScreen].bounds.size.width;
    landscapeFullscreenWidth  = [UIScreen mainScreen].bounds.size.height;
    
    [self loadAdRequest];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
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
-(void)dealloc
{
    self.adView.delegate = nil;
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}



@end

