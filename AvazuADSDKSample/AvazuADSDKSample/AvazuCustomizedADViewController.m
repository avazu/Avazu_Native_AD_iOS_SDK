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

@synthesize blockBackColor;
@synthesize appTitleColor;
@synthesize buttonBackColor;
@synthesize buttonTextColor;
@synthesize mainBackColor;

@synthesize viewWidth;
@synthesize viewHeight;
@synthesize adType;
@synthesize appCount;
@synthesize isNeedIcon;
@synthesize isNeedTitle;
@synthesize isNeedRating;
@synthesize isNeedCat;
@synthesize isNeedSize;
@synthesize isNeedInstallButton;
@synthesize isNeedReviewNumber;
@synthesize adView;

@synthesize screenHeight;
@synthesize screenWidth;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {

        [self.view setBackgroundColor:[UIColor whiteColor]];
    
        screenHeight = [UIScreen mainScreen].applicationFrame.size.height;
        screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    
        UIView * dummyview = [[UIView alloc]initWithFrame:CGRectMake(0, 66, self.viewWidth, self.viewHeight)];
        [self.view addSubview:dummyview];

        adView = [[AvazuADView alloc] initWithFrame:CGRectMake((screenWidth - self.viewWidth)/2, 66, self.viewWidth, self.viewHeight)
                                             adType:self.adType
                                           sourceID:@"6395"];
        adView.appCount   = self.appCount;
    
        adView.isNeedIcon   = self.isNeedIcon;
        adView.isNeedTitle  = self.isNeedTitle;
        adView.isNeedRating = self.isNeedRating;
        adView.isNeedCat    = self.isNeedCat;
        adView.isNeedSize   = self.isNeedSize;
        adView.isNeedSize   = self.isNeedSize;
        adView.isNeedInstallButton = self.isNeedInstallButton;
        adView.isNeedReviewNumber  = self.isNeedReviewNumber;
        if (self.mainBackColor) {
            adView.mainBackColor = self.mainBackColor;
        }
        if (self.blockBackColor) {
            adView.blockBackColor = self.blockBackColor;
        }
        if (self.buttonBackColor) {
            adView.buttonBackColor = self.buttonBackColor;
        }
        if (self.buttonTextColor) {
            adView.buttonTextColor = self.buttonTextColor;
        }
        if (self.mainBackColor) {
            adView.mainBackColor = self.mainBackColor;
        }
        if (self.appTitleColor) {
            adView.appTitleColor = self.appTitleColor;
        }
        [adView loadAD];
        [self.view addSubview:adView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
