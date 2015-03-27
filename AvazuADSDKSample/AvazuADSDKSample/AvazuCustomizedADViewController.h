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

@property (nonatomic, strong) NSDictionary* adviewSettings;
@property (nonatomic, assign) int adType;
@property (nonatomic ,strong) AvazuADView * adView;

@end
