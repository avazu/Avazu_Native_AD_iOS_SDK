//
//  AvazuCustomizedBannerSettingViewController.h
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/22.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvazuCustomizedBannerSettingViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *appCountTextfield;
@property (weak, nonatomic) IBOutlet UITextField *viewWidthTextfield;
@property (weak, nonatomic) IBOutlet UITextField *viewHeightTextfield;
@property (weak, nonatomic) IBOutlet UISwitch *isNeedIconSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isNeedTitleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isNeedRatingSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isNeedCatagorySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isNeedSizeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isNeedButtonSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isNeedReviewNumberSwitch;


@property (weak, nonatomic) IBOutlet UITextField *blockBackColorTextfield;
@property (weak, nonatomic) IBOutlet UITextField *appTitleColorTextfield;
@property (weak, nonatomic) IBOutlet UITextField *buttonBackColorTextfield;
@property (weak, nonatomic) IBOutlet UITextField *buttonTextColorTextfield;
@property (weak, nonatomic) IBOutlet UITextField *mainBackColorTextfield;

@property (weak, nonatomic) IBOutlet UILabel *appCountLabel;
@property (strong, nonatomic) id detailItem;
@end
