//  AvazuSampleMasterViewController.h
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/4.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.


#import <UIKit/UIKit.h>
#import "AvazuNativeAd.h"

@class AvazuSampleDetailViewController;

@interface AvazuSampleMasterViewController : UITableViewController

@property (strong, nonatomic) AvazuSampleDetailViewController *detailViewController;

@end
