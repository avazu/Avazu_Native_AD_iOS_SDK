//
//  AvazuADView.h
//  AvazuAdSDK
//
//  Created by caosc on 15/3/4.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AvazuADView;

@protocol AvazuADViewDelegate <NSObject>

@optional
- (void)avazuADViewLoadAdSucess:(AvazuADView *)adview;
- (void)avazuADView:(AvazuADView *)adview didFailToReceiveAdWithError:(NSError *)error;

@end

@interface AvazuADView: UIView
{
    __unsafe_unretained id <AvazuADViewDelegate> delegate;
}

#pragma mark - Ad Types

#define AVAZU_SINGLE_BANNER                 9
#define AVAZU_BANNER_APPWALL                10
#define AVAZU_TRANSPARENT_SINGLE_BANNER     11
#define AVAZU_SINGLE_BUTTON_APP_WALL        12
#define AVAZU_MULTIPLE_BUTTON_APP_WALL      13

#pragma mark - Initialization

@property (nonatomic, assign) IBOutlet __unsafe_unretained id <AvazuADViewDelegate> delegate;
@property (nonatomic, strong) UIWebView *webView;

//the customized background color for App wall
@property (nonatomic, copy) NSString*  blockBackColor;
@property (nonatomic, copy) NSString*  appTitleColor;
@property (nonatomic, copy) NSString*  buttonBackColor;
@property (nonatomic, copy) NSString*  buttonTextColor;
@property (nonatomic, copy) NSString*  mainBackColor;

//the valid traffic source ID from Avazu
@property (nonatomic, copy) NSString*  sourceID;

//loading indicator ON/OFF
@property (nonatomic, assign) BOOL isNeedLoadingIndicator;

//the customized settings
@property (nonatomic, assign) int  adType;
@property (nonatomic, assign) int  appCount;
@property (nonatomic, assign) int  transparentBannerAlpha;
@property (nonatomic, assign) BOOL isNeedIcon;
@property (nonatomic, assign) BOOL isNeedTitle;
@property (nonatomic, assign) BOOL isNeedRating;
@property (nonatomic, assign) BOOL isNeedCat;
@property (nonatomic, assign) BOOL isNeedSize;
@property (nonatomic, assign) BOOL isNeedInstallButton;
@property (nonatomic, assign) BOOL isNeedInstallNumber;
@property (nonatomic, assign) BOOL isNeedReviewNumber;
@property (nonatomic, assign) BOOL isDebug;

//iniitialize the adview 
- (id)initWithFrame:(CGRect)frame
             adType:(int) adType
           sourceID:(NSString*)sourceID;

//functions for adview
- (void)loadAD;

//error code
enum {
    AvazuADErrorInvalidParameter = 0,
    AvazuADErrorLoadWebTimeout = 1,
    AvazuADErrorNoOfferNow = 2
};

@end

extern NSString * const AvazuADErrorDomain;

