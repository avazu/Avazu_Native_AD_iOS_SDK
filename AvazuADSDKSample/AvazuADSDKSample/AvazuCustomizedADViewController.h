//
//  AvazuCustomizedADViewController.h
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/24.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AvazuADView.h"

@interface AvazuCustomizedADViewController : UIViewController


@property (nonatomic, strong) NSString*  blockBackColor;
@property (nonatomic, strong) NSString*  appTitleColor;
@property (nonatomic, strong) NSString*  buttonBackColor;
@property (nonatomic, strong) NSString*  buttonTextColor;
@property (nonatomic, strong) NSString*  mainBackColor;

@property (nonatomic, assign) CGFloat  viewWidth;
@property (nonatomic, assign) CGFloat  viewHeight;
@property (nonatomic, assign) int  adType;
@property (nonatomic, assign) int  appCount;
@property (nonatomic, assign) BOOL isNeedIcon;
@property (nonatomic, assign) BOOL isNeedTitle;
@property (nonatomic, assign) BOOL isNeedRating;
@property (nonatomic, assign) BOOL isNeedCat;
@property (nonatomic, assign) BOOL isNeedSize;
@property (nonatomic, assign) BOOL isNeedInstallButton;
@property (nonatomic, assign) BOOL isNeedReviewNumber;

@property (nonatomic ,strong) AvazuADView * adView;

@end
