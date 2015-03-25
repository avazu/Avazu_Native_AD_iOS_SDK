//
//  AvazuSampleDetailLandscapeViewCtroller.h
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/23.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AvazuADView.h"

@interface AvazuSampleDetailLandscapeViewCtroller : UIViewController <AvazuADViewDelegate>

@property (strong, nonatomic) AvazuADView *adView;

@property (strong, nonatomic) id detailItem;

@end

