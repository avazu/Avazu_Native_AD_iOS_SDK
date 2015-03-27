//AvazuCustomizedADSettingViewController.h
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/22.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AvazuADView.h"

@interface AvazuCustomizedADSettingViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField *appCountTextfield;
@property (nonatomic, weak) IBOutlet UITextField *viewWidthTextfield;
@property (nonatomic, weak) IBOutlet UITextField *viewHeightTextfield;
@property (nonatomic, weak) IBOutlet UISwitch *isNeedIconSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *isNeedTitleSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *isNeedRatingSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *isNeedCatagorySwitch;
@property (nonatomic, weak) IBOutlet UISwitch *isNeedSizeSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *isNeedButtonSwitch;
@property (nonatomic, weak) IBOutlet UISwitch *isNeedReviewNumberSwitch;

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic, weak) IBOutlet UITextField *blockBackColorTextfield;
@property (nonatomic, weak) IBOutlet UITextField *appTitleColorTextfield;
@property (nonatomic, weak) IBOutlet UITextField *buttonBackColorTextfield;
@property (nonatomic, weak) IBOutlet UITextField *buttonTextColorTextfield;
@property (nonatomic, weak) IBOutlet UITextField *mainBackColorTextfield;

@property (nonatomic, weak) IBOutlet UILabel *appCountLabel;
@property (nonatomic, assign) BOOL isBannerSettings;

@end
