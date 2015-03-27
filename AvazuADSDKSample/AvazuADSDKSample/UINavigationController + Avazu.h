//
//  NavigationController + Avazu.h
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/23.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (UINavigationController_AVAZU)

- (BOOL)shouldAutorotate;
- (NSUInteger)supportedInterfaceOrientations;
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;

@end
