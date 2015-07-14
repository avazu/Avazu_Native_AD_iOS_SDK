//
//  AvazuCustomizedADViewController.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/24.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "AvazuCustomizedADViewController.h"

@interface AvazuCustomizedADViewController ()
@property (nonatomic, assign) CGFloat screenHeight;
@property (nonatomic, assign) CGFloat screenWidth;
@end

@implementation AvazuCustomizedADViewController

@synthesize adView;
@synthesize screenHeight;
@synthesize screenWidth;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView
{
    [self.view setBackgroundColor:[UIColor whiteColor]];

    screenHeight = [UIScreen mainScreen].applicationFrame.size.height;
    screenWidth = [UIScreen mainScreen].applicationFrame.size.width;

    CGFloat adViewWidth  =  [[self.adviewSettings objectForKey:@"adFrameWidth" ] floatValue];
    CGFloat adViewHeight =  [[self.adviewSettings objectForKey:@"adFrameHeight" ] floatValue];

    UIView * dummyview = [[UIView alloc]initWithFrame:CGRectMake(0, 66, adViewWidth, adViewHeight)];
    [self.view addSubview:dummyview];

    adView = [[AvazuADView alloc] initWithFrame:CGRectMake((screenWidth - adViewWidth)/2, 66, adViewWidth, adViewHeight)
                                         adType:self.adType
                                       sourceID:@"15587"];

    adView.appCount            = [[self.adviewSettings objectForKey:@"appCount" ] intValue];

    adView.isNeedIcon          = [[self.adviewSettings objectForKey:@"isNeedIcon" ] boolValue];
    adView.isNeedTitle         = [[self.adviewSettings objectForKey:@"isNeedTitle" ] boolValue];
    adView.isNeedRating        = [[self.adviewSettings objectForKey:@"isNeedRating" ] boolValue];
    adView.isNeedCat           = [[self.adviewSettings objectForKey:@"isNeedCatagory" ] boolValue];
    adView.isNeedSize          = [[self.adviewSettings objectForKey:@"isNeedSize" ] boolValue];
    adView.isNeedInstallButton = [[self.adviewSettings objectForKey:@"isNeedInstallButton" ] boolValue];
    adView.isNeedReviewNumber  = [[self.adviewSettings objectForKey:@"isNeedReviewNumber" ] boolValue];

    adView.mainBackColor       = [self.adviewSettings objectForKey:@"mainBackColor" ];
    adView.blockBackColor      = [self.adviewSettings objectForKey:@"blockBackColor"];
    adView.buttonBackColor     = [self.adviewSettings objectForKey:@"buttonBackColor"];
    adView.buttonTextColor     = [self.adviewSettings objectForKey:@"buttonTextColor"];
    adView.appTitleColor       = [self.adviewSettings objectForKey:@"appTitleColor"];

    [adView loadAD];
    [self.view addSubview:adView];

}

-(BOOL)shouldAutorotate
{
    return YES;
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
