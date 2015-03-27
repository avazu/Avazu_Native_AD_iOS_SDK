//
//NavigationController + Avazu.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/23.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "UINavigationController + Avazu.h"

@implementation UINavigationController(UINavigationController_AVAZU)

- (BOOL)shouldAutorotate {
    return [self.visibleViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];;
}

@end
