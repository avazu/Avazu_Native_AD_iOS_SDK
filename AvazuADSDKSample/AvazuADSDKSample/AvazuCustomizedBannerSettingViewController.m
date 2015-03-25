//
//  AvazuCustomizedBannerSettingViewController.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/22.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "AvazuCustomizedBannerSettingViewController.h"
#import "AvazuCustomizedADViewController.h"
#import "AvazuADView.h"


@interface AvazuCustomizedBannerSettingViewController ()
@property (nonatomic, assign) int bannerType;
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, strong) NSString * appCount;
@property (nonatomic, assign) BOOL isNeedIcon;
@property (nonatomic, assign) BOOL isNeedTitle;
@property (nonatomic, assign) BOOL isNeedRating;
@property (nonatomic, assign) BOOL isNeedCatagory;
@property (nonatomic, assign) BOOL isNeedSize;
@property (nonatomic, assign) BOOL isNeedButton;
@property (nonatomic, assign) BOOL isNeedReview;
@property (nonatomic, assign) id currentResponder;


@end

@implementation AvazuCustomizedBannerSettingViewController

@synthesize detailItem;


- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.bannerType) {
        self.bannerType = AVAZU_SINGLE_BANNER;
    }
    [self configureForSingleBanner];
    //add gestu rerecognizer to hide the keyboard
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
}

- (void)configureView {
   
 
}

- (void) configureForSingleBanner{
    //app count
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [self.appCountTextfield setHidden:YES];
    [self.appCountLabel setHidden:YES];
    
    self.appCountTextfield.text = @"4";

    if ([defaults objectForKey:@"singlebanner_frame_width"]) {
        self.viewWidthTextfield.text = [defaults objectForKey:@"singlebanner_frame_width"];
    }
    else {
        self.viewWidthTextfield.text = @"320";
    }
    
    if ([defaults objectForKey:@"singlebanner_frame_height"]) {
        self.viewHeightTextfield.text = [defaults objectForKey:@"singlebanner_frame_height"];
    }
    else {
        self.viewHeightTextfield.text = @"100";
    }

    // swithch
    if ([defaults objectForKey:@"singlebanner_isneedicon"]) {
        [self.isNeedIconSwitch setOn:[defaults boolForKey:@"singlebanner_isneedicon"]
                            animated:YES];
        self.isNeedIcon = [defaults boolForKey:@"singlebanner_isneedicon"];
    }
    else {
        [self.isNeedIconSwitch setOn:YES animated:YES];
        self.isNeedIcon = YES;
    }
    
    if ([defaults objectForKey:@"singlebanner_isneedtitle"]) {
        [self.isNeedTitleSwitch setOn:[defaults boolForKey:@"singlebanner_isneedtitle"]
                             animated:YES];
        self.isNeedTitle = [defaults boolForKey:@"singlebanner_isneedtitle"];
    }
    else {
        [self.isNeedTitleSwitch setOn:YES animated:YES];
        self.isNeedTitle = YES;
    }
    
    if ([defaults objectForKey:@"singlebanner_isneedrating"]) {
        [self.isNeedRatingSwitch setOn:[defaults boolForKey:@"singlebanner_isneedrating"]
                              animated:YES];
        self.isNeedRating = [defaults boolForKey:@"singlebanner_isneedrating"];
    }
    else {
        [self.isNeedRatingSwitch setOn:YES animated:YES];
        self.isNeedRating = YES;
    }
    
    if ([defaults objectForKey:@"singlebanner_isneedcatagory"]) {
        [self.isNeedCatagorySwitch setOn:[defaults boolForKey:@"singlebanner_isneedcatagory"]
                                animated:YES];
        self.isNeedCatagory = [defaults boolForKey:@"singlebanner_isneedcatagory"];
    }
    else {
        [self.isNeedCatagorySwitch setOn:YES animated:YES];
        self.isNeedCatagory = YES;
    }
    if ([defaults objectForKey:@"singlebanner_isneedsize"]) {
        [self.isNeedSizeSwitch setOn:[defaults boolForKey:@"singlebanner_isneedsize"]
                            animated:YES];
        self.isNeedSize = [defaults boolForKey:@"singlebanner_isneedsize"];
    }
    else {
        [self.isNeedSizeSwitch setOn:YES animated:YES];
        self.isNeedSize = YES;
    }
    if ([defaults objectForKey:@"singlebanner_isneedbutton"]) {
        [self.isNeedButtonSwitch setOn:[defaults boolForKey:@"singlebanner_isneedbutton"]
                              animated:YES];
        self.isNeedButton = [defaults boolForKey:@"singlebanner_isneedbutton"];
    }
    else {
        [self.isNeedButtonSwitch setOn:YES animated:YES];
        self.isNeedButton = YES;
    }
    if ([defaults objectForKey:@"singlebanner_isneedreviewnumber"]) {
        [self.isNeedReviewNumberSwitch setOn:[defaults boolForKey:@"singlebanner_isneedreviewnumber"]
                                    animated:YES];
        self.isNeedReview = [defaults boolForKey:@"singlebanner_isneedreviewnumber"];
    }
    else {
        [self.isNeedReviewNumberSwitch setOn:YES animated:YES];
        self.isNeedReview = YES;
    }
    
    //color settings
    if ([defaults objectForKey:@"singlebanner_blockbackcolor"]) {
        self.blockBackColorTextfield.text = [defaults objectForKey:@"singlebanner_blockbackcolor"];
    }
    else {
        self.blockBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singlebanner_apptitlecolor"]) {
        self.appTitleColorTextfield.text = [defaults objectForKey:@"singlebanner_apptitlecolor"];
    }
    else {
        self.appTitleColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singlebanner_buttonbackcolor"]) {
        self.buttonBackColorTextfield.text = [defaults objectForKey:@"singlebanner_buttonbackcolor"];
    }
    else {
        self.buttonBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singlebanner_buttontextcolor"]) {
        self.buttonTextColorTextfield.text = [defaults objectForKey:@"singlebanner_buttontextcolor"];
    }
    else {
        self.buttonTextColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singlebanner_mainbackcolor"]) {
        self.mainBackColorTextfield.text = [defaults objectForKey:@"singlebanner_mainbackcolor"];
    }
    else {
        self.mainBackColorTextfield.text = @"";
    }
}


- (void) configureForBannerAppWall{
    //app count
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [self.appCountTextfield setHidden:NO];
    [self.appCountLabel setHidden:NO
     ];

    if ([defaults objectForKey:@"bannerwall_appcount"]) {
        self.appCountTextfield.text = [defaults objectForKey:@"bannerwall_appcount"];
    }
    else {
        self.appCountTextfield.text = @"4";
    }
    
    if ([defaults objectForKey:@"bannerwall_frame_width"]) {
        self.viewWidthTextfield.text = [defaults objectForKey:@"bannerwall_frame_width"];
    }
    else {
        self.viewWidthTextfield.text = @"320";
    }
    
    if ([defaults objectForKey:@"bannerwall_frame_height"]) {
        self.viewHeightTextfield.text = [defaults objectForKey:@"bannerwall_frame_height"];
    }
    else {
        self.viewHeightTextfield.text = @"400";
    }
    
    // swithch
    if ([defaults objectForKey:@"bannerwall_isneedicon"]) {
        [self.isNeedIconSwitch setOn:[defaults boolForKey:@"bannerwall_isneedicon"]
                            animated:YES];
        self.isNeedIcon = [defaults boolForKey:@"bannerwall_isneedicon"];
    }
    else {
        [self.isNeedIconSwitch setOn:YES animated:YES];
        self.isNeedIcon = YES;
    }
    
    if ([defaults objectForKey:@"bannerwall_isneedtitle"]) {
        [self.isNeedTitleSwitch setOn:[defaults boolForKey:@"bannerwall_isneedtitle"]
                             animated:YES];
        self.isNeedTitle = [defaults boolForKey:@"bannerwall_isneedtitle"];
    }
    else {
        [self.isNeedTitleSwitch setOn:YES animated:YES];
        self.isNeedTitle = YES;
    }
    
    if ([defaults objectForKey:@"bannerwall_isneedrating"]) {
        [self.isNeedRatingSwitch setOn:[defaults boolForKey:@"bannerwall_isneedrating"]
                              animated:YES];
        self.isNeedRating = [defaults boolForKey:@"bannerwall_isneedrating"];
    }
    else {
        [self.isNeedRatingSwitch setOn:YES animated:YES];
        self.isNeedRating = YES;
    }
    
    if ([defaults objectForKey:@"bannerwall_isneedcatagory"]) {
        [self.isNeedCatagorySwitch setOn:[defaults boolForKey:@"bannerwall_isneedcatagory"]
                                animated:YES];
        self.isNeedCatagory = [defaults boolForKey:@"bannerwall_isneedcatagory"];
    }
    else {
        [self.isNeedCatagorySwitch setOn:YES animated:YES];
        self.isNeedCatagory = YES;
    }
    if ([defaults objectForKey:@"bannerwall_isneedsize"]) {
        [self.isNeedSizeSwitch setOn:[defaults boolForKey:@"bannerwall_isneedsize"]
                            animated:YES];
        self.isNeedSize = [defaults boolForKey:@"bannerwall_isneedsize"];
    }
    else {
        [self.isNeedSizeSwitch setOn:YES animated:YES];
        self.isNeedSize = YES;
    }
    if ([defaults objectForKey:@"bannerwall_isneedbutton"]) {
        [self.isNeedButtonSwitch setOn:[defaults boolForKey:@"bannerwall_isneedbutton"]
                              animated:YES];
        self.isNeedButton = [defaults boolForKey:@"bannerwall_isneedbutton"];
    }
    else {
        [self.isNeedButtonSwitch setOn:YES animated:YES];
        self.isNeedButton = YES;
    }
    if ([defaults objectForKey:@"bannerwall_isneedreviewnumber"]) {
        [self.isNeedReviewNumberSwitch setOn:[defaults boolForKey:@"bannerwall_isneedreviewnumber"]
                                    animated:YES];
        self.isNeedReview = [defaults boolForKey:@"bannerwall_isneedreviewnumber"];
    }
    else {
        [self.isNeedReviewNumberSwitch setOn:YES animated:YES];
        self.isNeedReview = YES;
    }
    
    //color settings
    if ([defaults objectForKey:@"bannerwall_blockbackcolor"]) {
        self.blockBackColorTextfield.text = [defaults objectForKey:@"bannerwall_blockbackcolor"];
    }
    else {
        self.blockBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"bannerwall_apptitlecolor"]) {
        self.appTitleColorTextfield.text = [defaults objectForKey:@"bannerwall_apptitlecolor"];
    }
    else {
        self.appTitleColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"bannerwall_buttonbackcolor"]) {
        self.buttonBackColorTextfield.text = [defaults objectForKey:@"bannerwall_buttonbackcolor"];
    }
    else {
        self.buttonBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"bannerwall_buttontextcolor"]) {
        self.buttonTextColorTextfield.text = [defaults objectForKey:@"bannerwall_buttontextcolor"];
    }
    else {
        self.buttonTextColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"bannerwall_mainbackcolor"]) {
        self.mainBackColorTextfield.text = [defaults objectForKey:@"bannerwall_mainbackcolor"];
    }
    else {
        self.mainBackColorTextfield.text = @"";
    }
}

- (IBAction)BannerTypeIsChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            self.bannerType = AVAZU_SINGLE_BANNER;
            [self saveUserDefaultForBannerAppwall];
            [self configureForSingleBanner];
            break;
        case 1:
            self.bannerType= AVAZU_BANNER_APPWALL;
            [self saveUserDefaultForSingleBanner];
            [self configureForBannerAppWall];
            break;
    }
}

- (IBAction)isNeedIconSwitchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedIcon = switchControl.isOn;
}
- (IBAction)isNeedTitleSwitchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedTitle = switchControl.isOn;
}
- (IBAction)isNeedRatingSwitchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedRating = switchControl.isOn;
}
- (IBAction)isNeedCatagorySwitchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedCatagory = switchControl.isOn;
}
- (IBAction)isNeedSizeSwitchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedSize = switchControl.isOn;
}
- (IBAction)isNeedButtonSwitchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedButton = switchControl.isOn;
}
- (IBAction)isNeedReviewNumberSwitchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedReview = switchControl.isOn;
}

- (IBAction)onConfirmButtonClicked:(id)sender {
    if (self.bannerType == AVAZU_SINGLE_BANNER) {
        [self saveUserDefaultForSingleBanner];
    }
    else {
        [self saveUserDefaultForBannerAppwall];
    }
    AvazuCustomizedADViewController * customizedADView = [[AvazuCustomizedADViewController alloc] init];
    self.viewWidth  = [self.viewWidthTextfield.text floatValue];

    customizedADView.viewHeight      = [self.viewHeightTextfield.text floatValue];
    customizedADView.viewWidth       = [self.viewWidthTextfield.text floatValue];
    customizedADView.appCount        = [self.appCountTextfield.text intValue];
    customizedADView.adType          = self.bannerType;
    customizedADView.isNeedIcon      = self.isNeedIcon;
    customizedADView.isNeedTitle     = self.isNeedTitle;
    customizedADView.isNeedRating    = self.isNeedRating;
    customizedADView.isNeedCat       = self.isNeedCatagory;
    customizedADView.isNeedSize      = self.isNeedSize;
    customizedADView.isNeedInstallButton = self.isNeedButton;
    customizedADView.isNeedReviewNumber  = self.isNeedReview;
    customizedADView.mainBackColor   = self.mainBackColorTextfield.text;
    customizedADView.buttonTextColor = self.buttonTextColorTextfield.text;
    customizedADView.buttonBackColor = self.buttonBackColorTextfield.text;
    customizedADView.blockBackColor  = self.blockBackColorTextfield.text;
    customizedADView.appTitleColor   = self.appTitleColorTextfield.text;

    
    [self.navigationController pushViewController:customizedADView animated:NO];

}

- (void) saveUserDefaultForSingleBanner {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.appCountTextfield.text
                 forKey:@"singlebanner_appcount"];
    
    [defaults setObject:self.viewHeightTextfield.text
                 forKey:@"singlebanner_frame_height"];
    
    [defaults setObject:self.viewWidthTextfield.text
                 forKey:@"singlebanner_frame_width"];
    
    [defaults setBool:self.isNeedIcon
               forKey:@"singlebanner_isneedicon"];

    [defaults setBool:self.isNeedTitle
               forKey:@"singlebanner_isneedtitle"];

    [defaults setBool:self.isNeedRating
               forKey:@"singlebanner_isneedrating"];

    [defaults setBool:self.isNeedCatagory
               forKey:@"singlebanner_isneedcatagory"];

    [defaults setBool:self.isNeedSize
               forKey:@"singlebanner_isneedsize"];

    [defaults setBool:self.isNeedButton
               forKey:@"singlebanner_isneedbutton"];

    [defaults setBool:self.isNeedReview
               forKey:@"singlebanner_isneedreviewnumber"];

    [defaults setBool:self.isNeedReview
               forKey:@"singlebanner_isneedreviewnumber"];

    [defaults setObject:self.blockBackColorTextfield.text
                 forKey:@"singlebanner_blockbackcolor"];

    [defaults setObject:self.appTitleColorTextfield.text
                 forKey:@"singlebanner_apptitlecolor"];

    [defaults setObject:self.buttonBackColorTextfield.text
                 forKey:@"singlebanner_buttonbackcolor"];

    [defaults setObject:self.buttonTextColorTextfield.text
                 forKey:@"singlebanner_buttontextcolor"];

    [defaults setObject:self.mainBackColorTextfield.text
                 forKey:@"singlebanner_mainbackcolor"];
}

- (void) saveUserDefaultForBannerAppwall {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.appCountTextfield.text
                 forKey:@"bannerwall_appcount"];
    
    [defaults setObject:self.viewHeightTextfield.text
                 forKey:@"bannerwall_frame_height"];
    
    [defaults setObject:self.viewWidthTextfield.text
                 forKey:@"bannerwall_frame_width"];
    
    [defaults setBool:self.isNeedIcon
               forKey:@"bannerwall_isneedicon"];
    
    [defaults setBool:self.isNeedTitle
               forKey:@"bannerwall_isneedtitle"];
    
    [defaults setBool:self.isNeedRating
               forKey:@"bannerwall_isneedrating"];
    
    [defaults setBool:self.isNeedCatagory
               forKey:@"bannerwall_isneedcatagory"];
    
    [defaults setBool:self.isNeedSize
               forKey:@"bannerwall_isneedsize"];
    
    [defaults setBool:self.isNeedButton
               forKey:@"bannerwall_isneedbutton"];
    
    [defaults setBool:self.isNeedReview
               forKey:@"bannerwall_isneedreviewnumber"];
    
    [defaults setBool:self.isNeedReview
               forKey:@"bannerwall_isneedreviewnumber"];
    
    [defaults setObject:self.blockBackColorTextfield.text
                 forKey:@"bannerwall_blockbackcolor"];
    
    [defaults setObject:self.appTitleColorTextfield.text
                 forKey:@"bannerwall_apptitlecolor"];
    
    [defaults setObject:self.buttonBackColorTextfield.text
                 forKey:@"bannerwall_buttonbackcolor"];
    
    [defaults setObject:self.buttonTextColorTextfield.text
                 forKey:@"bannerwall_buttontextcolor"];
    
    [defaults setObject:self.mainBackColorTextfield.text
                 forKey:@"bannerwall_mainbackcolor"];
}

// hide keyboard
- (void)resignOnTap:(id)iSender {
    [self.currentResponder resignFirstResponder];
}

#pragma textfield delegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == 1 && self.bannerType == AVAZU_SINGLE_BANNER){
        return NO;
    }
    else return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentResponder = textField;
}

#pragma orientation control
- (BOOL) shouldAutorotate {
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}
@end
