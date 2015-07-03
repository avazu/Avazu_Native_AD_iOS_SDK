//
//  AvazuNativeAd.h
//  AvazuAdSDK
//
//  Created by caosc on 15/7/2.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AvazuADView.h"

@protocol AvazuNativeAdDelegate <NSObject>

@required
- (void)avazuGetRawdataSuccess:(NSArray *)dataArray;
- (void)avazuGetRawdataFailWithError: (NSError *)error;
@end

@interface AvazuNativeAd : NSObject
@property (nonatomic, weak) id<AvazuNativeAdDelegate> delegate;

- (instancetype)init;

- (void)loadNativeAdWithSourceId: (NSString *) sourceId
                 excludePackages: (NSString *) excludePackages
                     limitNumber: (int) limitNumber;
@end
