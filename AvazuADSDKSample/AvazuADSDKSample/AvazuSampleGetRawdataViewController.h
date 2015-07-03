//
//  AvazuSampleGetRawdataViewController.h
//  AvazuADSDKSample
//
//  Created by caosc on 15/7/3.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AvazuNativeAd.h"

@interface AvazuSampleGetRawdataViewController : UIViewController <AvazuNativeAdDelegate>

@property (strong, nonatomic) AvazuNativeAd * nativdAd;
@property (strong, nonatomic) UITextView * textView;
@end
