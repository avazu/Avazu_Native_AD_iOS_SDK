//AvazuCustomizedADSettingViewController.m
//  AvazuADSDKSample
//
//  Created by caosc on 15/3/22.
//  Copyright (c) 2015年 net.avazu.adsdk. All rights reserved.
//

#import "AvazuCustomizedADSettingViewController.h"
#import "AvazuCustomizedADViewController.h"



@interface AvazuCustomizedADSettingViewController ()

@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSMutableArray *adObjects;
@property (nonatomic, strong) NSMutableDictionary *adData;
@property (nonatomic, strong) NSString *plistPath;

@property (nonatomic, assign) int adType;
@property (nonatomic, assign) BOOL isNeedIcon;
@property (nonatomic, assign) BOOL isNeedTitle;
@property (nonatomic, assign) BOOL isNeedRating;
@property (nonatomic, assign) BOOL isNeedCatagory;
@property (nonatomic, assign) BOOL isNeedSize;
@property (nonatomic, assign) BOOL isNeedButton;
@property (nonatomic, assign) BOOL isNeedReview;

@property (nonatomic, assign) id currentResponder;


@end

@implementation AvazuCustomizedADSettingViewController
@synthesize adType;
@synthesize adObjects;
@synthesize adData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self checkPlistPath];
    // configure the view according to the isBannerSettings
    if (self.isBannerSettings) {
        adType = AVAZU_SINGLE_BANNER;
        [self configureForSingleBanner];
    }
    else {
        adType = AVAZU_SINGLE_BUTTON_APP_WALL;
        [self.segmentControl setTitle:@"Single Line Appwall" forSegmentAtIndex:0];
        [self.segmentControl setTitle:@"Multiple Line Appwall" forSegmentAtIndex:1];
        [self configureForSinglelineButton];
    }

    [self setTapRecognizerForHideKeyboard];
}

- (void) checkPlistPath
{
    // For plist file in main bundle is not wirtable, this function is a tricky way to copy main bundle file to user domain directory for writing, a better way to save settings is using user default, but for the situation it will generate too much duplicate code
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.plistPath = [documentsDirectory stringByAppendingPathComponent:@"Avazu-CustomizedSettingsData.plist"];
    NSError *error;

    self.fileManager= [NSFileManager defaultManager];

    if (![self.fileManager fileExistsAtPath: self.plistPath])
    {
        //when first time touch to the plist file, the copy file path is empty, so we need to copy plist file in mainbunle into this directory
        NSString * mainBundlePlistPath = [[NSBundle mainBundle] pathForResource:@"Avazu-CustomizedSettingsData" ofType:@"plist"];
        [self.fileManager copyItemAtPath:mainBundlePlistPath toPath: self.plistPath error:&error];
    }
    // use NSMutableArray to get all data in plist file for writable usage
    adObjects = [NSMutableArray arrayWithContentsOfFile:self.plistPath];
}

- (void) setTapRecognizerForHideKeyboard
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
}
- (void) configureForSingleBanner
{
    [self.appCountTextfield setHidden:YES];
    [self.appCountLabel setHidden:YES];
    adData = adObjects[0];
    [self setupView];
}

- (void) configureForBannerAppWall
{
    [self.appCountTextfield setHidden:NO];
    [self.appCountLabel setHidden:NO];
    adData = adObjects[1];
    [self setupView];
}

- (void) configureForSinglelineButton
{
    [self.appCountTextfield setHidden:NO];
    [self.appCountLabel setHidden:NO];
    adData = adObjects[2];
    [self setupView];
}

- (void) configureForMultiplelineButton
{
    [self.appCountTextfield setHidden:NO];
    [self.appCountLabel setHidden:NO];
    adData = adObjects[3];
    [self setupView];
}

- (void) setupView
{
    self.appCountTextfield.text   = [adData objectForKey:@"appCount"];
    // switch settings
    self.viewWidthTextfield.text  = [adData objectForKey:@"adFrameWidth"];
    self.viewHeightTextfield.text = [adData objectForKey:@"adFrameHeight"];

    self.isNeedIcon     = [[adData objectForKey:@"isNeedIcon"] intValue];
    self.isNeedTitle    = [[adData objectForKey:@"isNeedTitle"] intValue];
    self.isNeedRating   = [[adData objectForKey:@"isNeedRating"] intValue];
    self.isNeedCatagory = [[adData objectForKey:@"isNeedCatagory"] intValue];
    self.isNeedSize     = [[adData objectForKey:@"isNeedSize"] intValue];
    self.isNeedButton   = [[adData objectForKey:@"isNeedInstallButton"] intValue];
    self.isNeedReview   = [[adData objectForKey:@"isNeedReviewNumber"] intValue];

    // switch settings
    [self.isNeedIconSwitch setOn:self.isNeedIcon animated:YES];
    [self.isNeedTitleSwitch setOn:self.isNeedTitle animated:YES];
    [self.isNeedRatingSwitch setOn:self.isNeedRating animated:YES];
    [self.isNeedCatagorySwitch setOn:self.isNeedCatagory animated:YES];
    [self.isNeedSizeSwitch setOn:self.isNeedSize animated:YES];
    [self.isNeedButtonSwitch setOn:self.isNeedButton animated:YES];
    [self.isNeedReviewNumberSwitch setOn:self.isNeedReview animated:YES];

    //color settings
    self.blockBackColorTextfield.text  = [adData objectForKey:@"blockBackColor"];
    self.appTitleColorTextfield.text   = [adData objectForKey:@"appTitleColor"];
    self.buttonBackColorTextfield.text = [adData objectForKey:@"buttonBackColor"];
    self.buttonTextColorTextfield.text = [adData objectForKey:@"buttonTextColor"];
    self.mainBackColorTextfield.text   = [adData objectForKey:@"mainBackColor"];
}

- (IBAction)BannerTypeIsChanged:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    if (self.isBannerSettings) {
        switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                adType = AVAZU_SINGLE_BANNER;
                [self saveDataForBannerAppwall];
                [self configureForSingleBanner];
                break;
            case 1:
                adType= AVAZU_BANNER_APPWALL;
                [self saveDataForSingleBanner];
                [self configureForBannerAppWall];
                break;
        }
    }
    else {
        switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                adType = AVAZU_SINGLE_BUTTON_APP_WALL;
                [self saveDataForMultiplelineButton];
                [self configureForSinglelineButton];
                break;
            case 1:
                adType= AVAZU_MULTIPLE_BUTTON_APP_WALL;
                [self saveDataForSinglelineButton];
                [self configureForMultiplelineButton];
                break;
        }
    }
}

//IBaction for all switch
- (IBAction)isNeedIconSwitchChanged:(id)sender
{
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedIcon = switchControl.isOn;
}
- (IBAction)isNeedTitleSwitchChanged:(id)sender
{
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedTitle = switchControl.isOn;
}
- (IBAction)isNeedRatingSwitchChanged:(id)sender
{
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedRating = switchControl.isOn;
}
- (IBAction)isNeedCatagorySwitchChanged:(id)sender
{
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedCatagory = switchControl.isOn;
}
- (IBAction)isNeedSizeSwitchChanged:(id)sender
{
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedSize = switchControl.isOn;
}
- (IBAction)isNeedButtonSwitchChanged:(id)sender
{
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedButton = switchControl.isOn;
}
- (IBAction)isNeedReviewNumberSwitchChanged:(id)sender
{
    UISwitch *switchControl = (UISwitch *)sender;
    self.isNeedReview = switchControl.isOn;
}

- (IBAction)onConfirmButtonClicked:(id)sender
{
    if (adType == AVAZU_SINGLE_BANNER) {
        [self saveDataForSingleBanner];
    }
    else if (adType == AVAZU_BANNER_APPWALL) {
        [self saveDataForBannerAppwall];
    }
    else if (adType == AVAZU_SINGLE_BUTTON_APP_WALL){
        [self saveDataForSinglelineButton];
    }
    else {
        [self saveDataForMultiplelineButton];
    }
    AvazuCustomizedADViewController * customizedADView = [[AvazuCustomizedADViewController alloc] init];

    customizedADView.AdviewSettings  = adData;
    customizedADView.adType = self.adType;

    [self.navigationController pushViewController:customizedADView animated:NO];
}

- (void) saveDataForSingleBanner
{
    adData = adObjects[0];
    [self saveData];
}

- (void) saveDataForBannerAppwall
{
    adData = adObjects[1];
    [self saveData];
}

- (void) saveDataForSinglelineButton
{
    adData = adObjects[2];
    [self saveData];
}

- (void) saveDataForMultiplelineButton
{
    adData = adObjects[3];
    [self saveData];
}

- (void) saveData
{
    [adData setValue:self.appCountTextfield.text
              forKey:@"appCount"];

    [adData setValue:self.viewHeightTextfield.text
              forKey:@"adFrameHeight"];

    [adData setValue:self.viewWidthTextfield.text
              forKey:@"adFrameWidth"];

    [adData setValue:[NSNumber numberWithBool:self.isNeedIcon]
                                       forKey:@"isNeedIcon"];

    [adData setValue:[NSNumber numberWithBool:self.isNeedTitle]
                                       forKey:@"isNeedTitle"];

    [adData setValue:[NSNumber numberWithBool:self.isNeedRating]
                                       forKey:@"isNeedRating"];

    [adData setValue:[NSNumber numberWithBool:self.isNeedCatagory]
                                        forKey:@"isNeedCatagory"];

    [adData setValue:[NSNumber numberWithBool:self.isNeedSize]
                                        forKey:@"isNeedSize"];

    [adData setValue:[NSNumber numberWithBool:self.isNeedButton]
                                        forKey:@"isNeedInstallButton"];

    [adData setValue:[NSNumber numberWithBool:self.isNeedReview]
                                        forKey:@"isNeedReviewNumber"];

    [adData setValue:self.blockBackColorTextfield.text
               forKey:@"blockBackColor"];

    [adData setValue:self.appTitleColorTextfield.text
               forKey:@"appTitleColor"];

    [adData setValue:self.buttonBackColorTextfield.text
               forKey:@"buttonBackColor"];

    [adData setValue:self.buttonTextColorTextfield.text
               forKey:@"buttonTextColor"];

    [adData setValue:self.mainBackColorTextfield.text
               forKey:@"mainBackColor"];

    if ([self.fileManager fileExistsAtPath:self.plistPath] == YES) {
        [adObjects writeToFile:self.plistPath atomically:YES];
    }
}
// hide keyboard
- (void)resignOnTap:(id)iSender
{
    [self.currentResponder resignFirstResponder];
}

#pragma textfield delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1 && adType == AVAZU_SINGLE_BANNER){
        return NO;
    }
    else return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentResponder = textField;
}

#pragma orientation control
- (BOOL) shouldAutorotate
{
    return NO;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
@end
