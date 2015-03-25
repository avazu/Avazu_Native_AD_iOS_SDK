//
//  AvazuCustomizedButtonAppWallSettingViewController.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/24.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "AvazuCustomizedButtonAppWallSettingViewController.h"
#import "AvazuCustomizedADViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface AvazuCustomizedButtonAppWallSettingViewController ()
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

@implementation AvazuCustomizedButtonAppWallSettingViewController

@synthesize detailItem;


- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.bannerType) {
        self.bannerType = AVAZU_SINGLE_BUTTON_APP_WALL;
    }
    [self configureForSingleLineAppwall];
    
    //add gestu rerecognizer to hide the keyboard
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
}

- (void) configureForSingleLineAppwall{
    //app count
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.appCountTextfield.text = @"4";
    
    if ([defaults objectForKey:@"singleline_wall_frame_width"]) {
        self.viewWidthTextfield.text = [defaults objectForKey:@"singleline_wall_frame_width"];
    }
    else {
        self.viewWidthTextfield.text = @"320";
    }
    
    if ([defaults objectForKey:@"singleline_wall_frame_height"]) {
        self.viewHeightTextfield.text = [defaults objectForKey:@"singleline_wall_frame_height"];
    }
    else {
        self.viewHeightTextfield.text = @"200";
    }
    
    // swithch
    if ([defaults objectForKey:@"singleline_wall_isneedicon"]) {
        [self.isNeedIconSwitch setOn:[defaults boolForKey:@"singleline_wall_isneedicon"]
                            animated:YES];
        self.isNeedIcon = [defaults boolForKey:@"singleline_wall_isneedicon"];
    }
    else {
        [self.isNeedIconSwitch setOn:YES animated:YES];
        self.isNeedIcon = YES;
    }
    
    if ([defaults objectForKey:@"singleline_wall_isneedtitle"]) {
        [self.isNeedTitleSwitch setOn:[defaults boolForKey:@"singleline_wall_isneedtitle"]
                             animated:YES];
        self.isNeedTitle = [defaults boolForKey:@"singleline_wall_isneedtitle"];
    }
    else {
        [self.isNeedTitleSwitch setOn:YES animated:YES];
        self.isNeedTitle = YES;
    }
    
    if ([defaults objectForKey:@"singleline_wall_isneedrating"]) {
        [self.isNeedRatingSwitch setOn:[defaults boolForKey:@"singleline_wall_isneedrating"]
                              animated:NO];
        self.isNeedRating = [defaults boolForKey:@"singleline_wall_isneedrating"];
    }
    else {
        [self.isNeedRatingSwitch setOn:NO animated:YES];
        self.isNeedRating = NO;
    }
    
    if ([defaults objectForKey:@"singleline_wall_isneedcatagory"]) {
        [self.isNeedCatagorySwitch setOn:[defaults boolForKey:@"singleline_wall_isneedcatagory"]
                                animated:YES];
        self.isNeedCatagory = [defaults boolForKey:@"singleline_wall_isneedcatagory"];
    }
    else {
        [self.isNeedCatagorySwitch setOn:NO animated:YES];
        self.isNeedCatagory = NO;
    }
    if ([defaults objectForKey:@"singleline_wall_isneedsize"]) {
        [self.isNeedSizeSwitch setOn:[defaults boolForKey:@"singleline_wall_isneedsize"]
                            animated:YES];
        self.isNeedSize = [defaults boolForKey:@"singleline_wall_isneedsize"];
    }
    else {
        [self.isNeedSizeSwitch setOn:NO animated:YES];
        self.isNeedSize = NO;
    }
    if ([defaults objectForKey:@"singleline_wall_isneedbutton"]) {
        [self.isNeedButtonSwitch setOn:[defaults boolForKey:@"singleline_wall_isneedbutton"]
                              animated:YES];
        self.isNeedButton = [defaults boolForKey:@"singleline_wall_isneedbutton"];
    }
    else {
        [self.isNeedButtonSwitch setOn:YES animated:YES];
        self.isNeedButton = YES;
    }
    if ([defaults objectForKey:@"singleline_wall_isneedreviewnumber"]) {
        [self.isNeedReviewNumberSwitch setOn:[defaults boolForKey:@"singleline_wall_isneedreviewnumber"]
                                    animated:YES];
        self.isNeedReview = [defaults boolForKey:@"singleline_wall_isneedreviewnumber"];
    }
    else {
        [self.isNeedReviewNumberSwitch setOn:NO animated:YES];
        self.isNeedReview = NO;
    }
    
    //color settings
    if ([defaults objectForKey:@"singleline_wall_blockbackcolor"]) {
        self.blockBackColorTextfield.text = [defaults objectForKey:@"singleline_wall_blockbackcolor"];
    }
    else {
        self.blockBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singleline_wall_apptitlecolor"]) {
        self.appTitleColorTextfield.text = [defaults objectForKey:@"singleline_wall_apptitlecolor"];
    }
    else {
        self.appTitleColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singleline_wall_buttonbackcolor"]) {
        self.buttonBackColorTextfield.text = [defaults objectForKey:@"singleline_wall_buttonbackcolor"];
    }
    else {
        self.buttonBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singleline_wall_buttontextcolor"]) {
        self.buttonTextColorTextfield.text = [defaults objectForKey:@"singleline_wall_buttontextcolor"];
    }
    else {
        self.buttonTextColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"singleline_wall_mainbackcolor"]) {
        self.mainBackColorTextfield.text = [defaults objectForKey:@"singleline_wall_mainbackcolor"];
    }
    else {
        self.mainBackColorTextfield.text = @"";
    }
}


- (void) configureForMultipeLineAppwall{
    //app count
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"muiltipleline_wall_appcount"]) {
        self.appCountTextfield.text = [defaults objectForKey:@"muiltipleline_wall_appcount"];
    }
    else {
        self.appCountTextfield.text = @"6";
    }
    
    if ([defaults objectForKey:@"muiltipleline_wall_frame_width"]) {
        self.viewWidthTextfield.text = [defaults objectForKey:@"muiltipleline_wall_frame_width"];
    }
    else {
        self.viewWidthTextfield.text = @"320";
    }
    
    if ([defaults objectForKey:@"muiltipleline_wall_frame_height"]) {
        self.viewHeightTextfield.text = [defaults objectForKey:@"muiltipleline_wall_frame_height"];
    }
    else {
        self.viewHeightTextfield.text = @"360";
    }
    
    // swithch
    if ([defaults objectForKey:@"muiltipleline_wall_isneedicon"]) {
        [self.isNeedIconSwitch setOn:[defaults boolForKey:@"muiltipleline_wall_isneedicon"]
                            animated:YES];
        self.isNeedIcon = [defaults boolForKey:@"muiltipleline_wall_isneedicon"];
    }
    else {
        [self.isNeedIconSwitch setOn:YES animated:YES];
        self.isNeedIcon = YES;
    }
    
    if ([defaults objectForKey:@"muiltipleline_wall_isneedtitle"]) {
        [self.isNeedTitleSwitch setOn:[defaults boolForKey:@"muiltipleline_wall_isneedtitle"]
                             animated:YES];
        self.isNeedTitle = [defaults boolForKey:@"muiltipleline_wall_isneedtitle"];
    }
    else {
        [self.isNeedTitleSwitch setOn:YES animated:YES];
        self.isNeedTitle = YES;
    }
    
    if ([defaults objectForKey:@"muiltipleline_wall_isneedrating"]) {
        [self.isNeedRatingSwitch setOn:[defaults boolForKey:@"muiltipleline_wall_isneedrating"]
                              animated:YES];
        self.isNeedRating = [defaults boolForKey:@"muiltipleline_wall_isneedrating"];
    }
    else {
        [self.isNeedRatingSwitch setOn:NO animated:YES];
        self.isNeedRating = NO;
    }
    
    if ([defaults objectForKey:@"muiltipleline_wall_isneedcatagory"]) {
        [self.isNeedCatagorySwitch setOn:[defaults boolForKey:@"muiltipleline_wall_isneedcatagory"]
                                animated:YES];
        self.isNeedCatagory = [defaults boolForKey:@"muiltipleline_wall_isneedcatagory"];
    }
    else {
        [self.isNeedCatagorySwitch setOn:NO animated:YES];
        self.isNeedCatagory = NO;
    }
    if ([defaults objectForKey:@"muiltipleline_wall_isneedsize"]) {
        [self.isNeedSizeSwitch setOn:[defaults boolForKey:@"muiltipleline_wall_isneedsize"]
                            animated:YES];
        self.isNeedSize = [defaults boolForKey:@"muiltipleline_wall_isneedsize"];
    }
    else {
        [self.isNeedSizeSwitch setOn:NO animated:YES];
        self.isNeedSize = NO;
    }
    if ([defaults objectForKey:@"muiltipleline_wall_isneedbutton"]) {
        [self.isNeedButtonSwitch setOn:[defaults boolForKey:@"muiltipleline_wall_isneedbutton"]
                              animated:YES];
        self.isNeedButton = [defaults boolForKey:@"muiltipleline_wall_isneedbutton"];
    }
    else {
        [self.isNeedButtonSwitch setOn:YES animated:YES];
        self.isNeedButton = YES;
    }
    if ([defaults objectForKey:@"muiltipleline_wall_isneedreviewnumber"]) {
        [self.isNeedReviewNumberSwitch setOn:[defaults boolForKey:@"muiltipleline_wall_isneedreviewnumber"]
                                    animated:YES];
        self.isNeedReview = [defaults boolForKey:@"muiltipleline_wall_isneedreviewnumber"];
    }
    else {
        [self.isNeedReviewNumberSwitch setOn:NO animated:YES];
        self.isNeedReview = NO;
    }
    
    //color settings
    if ([defaults objectForKey:@"muiltipleline_wall_blockbackcolor"]) {
        self.blockBackColorTextfield.text = [defaults objectForKey:@"muiltipleline_wall_blockbackcolor"];
    }
    else {
        self.blockBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"muiltipleline_wall_apptitlecolor"]) {
        self.appTitleColorTextfield.text = [defaults objectForKey:@"muiltipleline_wall_apptitlecolor"];
    }
    else {
        self.appTitleColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"muiltipleline_wall_buttonbackcolor"]) {
        self.buttonBackColorTextfield.text = [defaults objectForKey:@"muiltipleline_wall_buttonbackcolor"];
    }
    else {
        self.buttonBackColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"muiltipleline_wall_buttontextcolor"]) {
        self.buttonTextColorTextfield.text = [defaults objectForKey:@"muiltipleline_wall_buttontextcolor"];
    }
    else {
        self.buttonTextColorTextfield.text = @"";
    }
    if ([defaults objectForKey:@"muiltipleline_wall_mainbackcolor"]) {
        self.mainBackColorTextfield.text = [defaults objectForKey:@"muiltipleline_wall_mainbackcolor"];
    }
    else {
        self.mainBackColorTextfield.text = @"";
    }
}

- (IBAction)BannerTypeIsChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            self.bannerType = AVAZU_SINGLE_BUTTON_APP_WALL;
            [self saveUserDefaultForMultipleLineAppwall];
            [self configureForSingleLineAppwall];
            break;
        case 1:
            self.bannerType= AVAZU_MULTIPLE_BUTTON_APP_WALL;
            [self saveUserDefaultForSingleLineAppwall];
            [self configureForMultipeLineAppwall];
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
    if (self.bannerType == AVAZU_SINGLE_BUTTON_APP_WALL) {
        [self saveUserDefaultForSingleLineAppwall];
    }
    else {
        [self saveUserDefaultForMultipleLineAppwall];
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

- (void) saveUserDefaultForSingleLineAppwall {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.appCountTextfield.text
                 forKey:@"singleline_wall_appcount"];
    
    [defaults setObject:self.viewHeightTextfield.text
                 forKey:@"singleline_wall_frame_height"];
    
    [defaults setObject:self.viewWidthTextfield.text
                 forKey:@"singleline_wall_frame_width"];
    
    [defaults setBool:self.isNeedIcon
               forKey:@"singleline_wall_isneedicon"];
    
    [defaults setBool:self.isNeedTitle
               forKey:@"singleline_wall_isneedtitle"];
    
    [defaults setBool:self.isNeedRating
               forKey:@"singleline_wall_isneedrating"];
    
    [defaults setBool:self.isNeedCatagory
               forKey:@"singleline_wall_isneedcatagory"];
    
    [defaults setBool:self.isNeedSize
               forKey:@"singleline_wall_isneedsize"];
    
    [defaults setBool:self.isNeedButton
               forKey:@"singleline_wall_isneedbutton"];
    
    [defaults setBool:self.isNeedReview
               forKey:@"singleline_wall_isneedreviewnumber"];
    
    [defaults setBool:self.isNeedReview
               forKey:@"singleline_wall_isneedreviewnumber"];
    
    [defaults setObject:self.blockBackColorTextfield.text
                 forKey:@"singleline_wall_blockbackcolor"];
    
    [defaults setObject:self.appTitleColorTextfield.text
                 forKey:@"singleline_wall_apptitlecolor"];
    
    [defaults setObject:self.buttonBackColorTextfield.text
                 forKey:@"singleline_wall_buttonbackcolor"];
    
    [defaults setObject:self.buttonTextColorTextfield.text
                 forKey:@"singleline_wall_buttontextcolor"];
    
    [defaults setObject:self.mainBackColorTextfield.text
                 forKey:@"singleline_wall_mainbackcolor"];
}

- (void) saveUserDefaultForMultipleLineAppwall {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.appCountTextfield.text
                 forKey:@"muiltipleline_wall_appcount"];
    
    [defaults setObject:self.viewHeightTextfield.text
                 forKey:@"muiltipleline_wall_frame_height"];
    
    [defaults setObject:self.viewWidthTextfield.text
                 forKey:@"muiltipleline_wall_frame_width"];
    
    [defaults setBool:self.isNeedIcon
               forKey:@"muiltipleline_wall_isneedicon"];
    
    [defaults setBool:self.isNeedTitle
               forKey:@"muiltipleline_wall_isneedtitle"];
    
    [defaults setBool:self.isNeedRating
               forKey:@"muiltipleline_wall_isneedrating"];
    
    [defaults setBool:self.isNeedCatagory
               forKey:@"muiltipleline_wall_isneedcatagory"];
    
    [defaults setBool:self.isNeedSize
               forKey:@"muiltipleline_wall_isneedsize"];
    
    [defaults setBool:self.isNeedButton
               forKey:@"muiltipleline_wall_isneedbutton"];
    
    [defaults setBool:self.isNeedReview
               forKey:@"muiltipleline_wall_isneedreviewnumber"];
    
    [defaults setBool:self.isNeedReview
               forKey:@"muiltipleline_wall_isneedreviewnumber"];
    
    [defaults setObject:self.blockBackColorTextfield.text
                 forKey:@"muiltipleline_wall_blockbackcolor"];
    
    [defaults setObject:self.appTitleColorTextfield.text
                 forKey:@"muiltipleline_wall_apptitlecolor"];
    
    [defaults setObject:self.buttonBackColorTextfield.text
                 forKey:@"muiltipleline_wall_buttonbackcolor"];
    
    [defaults setObject:self.buttonTextColorTextfield.text
                 forKey:@"muiltipleline_wall_buttontextcolor"];
    
    [defaults setObject:self.mainBackColorTextfield.text
                 forKey:@"muiltipleline_wall_mainbackcolor"];
}

// hide keyboard
- (void)resignOnTap:(id)iSender {
    [self.currentResponder resignFirstResponder];
}

#pragma textfield delegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentResponder = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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

