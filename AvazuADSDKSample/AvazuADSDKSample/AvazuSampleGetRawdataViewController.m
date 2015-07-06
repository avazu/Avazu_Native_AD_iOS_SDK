//
//  AvazuSampleGetRawdataViewController.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/7/3.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "AvazuSampleGetRawdataViewController.h"
#import "AvazuNativeAd.h"

@implementation AvazuSampleGetRawdataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 66,
    [UIScreen mainScreen].applicationFrame.size.width,
    [UIScreen mainScreen].applicationFrame.size.height)];

    self.textView.textColor = [UIColor blackColor];
    self.textView.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];

    self.nativdAd = [[AvazuNativeAd alloc] init];
    self.nativdAd.delegate = self;
    [self.nativdAd loadNativeAdWithSourceId: @"15353"
                            excludePackages: @""
                                limitNumber: 10
                                     incent: 0
                                  creatives: 1
     ];
    
    //and so on adjust your view size according to your needs
}



#pragma avazuNativeDelegate

- (void)avazuGetRawdataFailWithError:(NSError *) error
{
    NSLog(@"avazuADViewLoadAdFail");
    NSLog(@"error:%@", error);
}
- (void)avazuGetRawdataSuccess:(NSArray *)dataArray
{
    NSLog(@"avazuADViewLoadAdSuccess");
    NSLog(@"dataArray:%@", [dataArray description]);
    if (dataArray != nil) {
        for(int i =1; i < [dataArray count]; i++) {
            NSLog(@"appcategory:%@", [dataArray[i] valueForKey:@"appcategory"]);
            NSLog(@"appinstalls:%@", [dataArray[i] valueForKey:@"appinstalls"]);
            NSLog(@"apprating:%@", [dataArray[i] valueForKey:@"apprating"]);
            NSLog(@"appreviewnum:%@", [dataArray[i] valueForKey:@"appreviewnum"]);
            NSLog(@"appsize:%@", [dataArray[i] valueForKey:@"appsize"]);
            NSLog(@"campaignid:%@", [dataArray[i] valueForKey:@"campaignid"]);
            NSLog(@"canpreclick:%@", [dataArray[i] valueForKey:@"canpreclick"]);
            NSLog(@"clkurl:%@", [dataArray[i] valueForKey:@"clkurl"]);
            NSLog(@"connectiontype:%@", [dataArray[i] valueForKey:@"connectiontype"]);
            NSLog(@"countries:%@", [dataArray[i] valueForKey:@"countries"]);
            NSLog(@"description:%@", [dataArray[i] valueForKey:@"description"]);
            NSLog(@"devicetype:%@", [dataArray[i] valueForKey:@"devicetype"]);
            NSLog(@"icon:%@", [dataArray[i] valueForKey:@"icon"]);
            NSLog(@"incent:%@", [dataArray[i] valueForKey:@"incent"]);
            NSLog(@"minosv:%@", [dataArray[i] valueForKey:@"minosv"]);
            NSLog(@"os:%@", [dataArray[i] valueForKey:@"os"]);
            NSLog(@"payout:%@", [dataArray[i] valueForKey:@"payout"]);
            NSLog(@"pkgname:%@", [dataArray[i] valueForKey:@"pkgname"]);
            NSLog(@"title:%@", [dataArray[i] valueForKey:@"title"]);
        }
        self.textView.text = [dataArray description];
        [self.view addSubview:self.textView];
    }
}

@end
