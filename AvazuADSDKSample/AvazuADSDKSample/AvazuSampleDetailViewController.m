//
//  AvazuSampleDetailViewController.m
//

#import "AvazuSampleDetailViewController.h"
#import "AppDelegate.h"

@interface AvazuSampleDetailViewController ()

@property (nonatomic, strong) UIPopoverController *masterPopoverController;
@property (nonatomic, strong) UIImageView *singleBannerPictureUpView;
@property (nonatomic, strong) UIImageView *singleBannerPicturedownView;
@property (nonatomic, strong) UIImageView *bannerWallPictureUpView;
@property (nonatomic, strong) UIImageView *bannerWallPictureDownView;
@property (nonatomic, strong) UIImageView *singlebuttonAppPictureUpView;
@property (nonatomic, strong) UIImageView *singlebuttonAppPictureDownView;
@property (nonatomic, strong) UIImageView *transparentBannerPicView;
@property (nonatomic, strong) UIImageView *multiplebuttonAppWallPicView;
@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat screenHeight;
@property (nonatomic, assign) CGFloat landscapeFullscreenHeight;
@property (nonatomic, assign) CGFloat landscapeFullscreenWidth;

- (void)configureView;

@end

@implementation AvazuSampleDetailViewController

@synthesize detailItem;
@synthesize masterPopoverController;
@synthesize statusLabel;
@synthesize statusView;
@synthesize adView;
@synthesize screenWidth;
@synthesize screenHeight;
@synthesize landscapeFullscreenHeight;
@synthesize landscapeFullscreenWidth;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

-(void)loadAdRequest {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Single_Banner"]) {
            NSLog(@"Initializing %@",[self.detailItem objectForKey:@"title"]);
            
            NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);

            UIImage* playerIdle = [UIImage imageNamed:@"image_up2.jpg"];

            _singleBannerPictureUpView = [[UIImageView alloc]initWithFrame:(CGRectZero)];

            _singleBannerPictureUpView.frame = CGRectMake(0, 66, screenWidth, screenHeight*0.75);

            [_singleBannerPictureUpView setImage: playerIdle];

            [self.view addSubview:_singleBannerPictureUpView];

            //create a single banner adview start
            CGRect adFrame = CGRectMake(0, screenHeight*0.75 + 66, screenWidth, adSize.height);

            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_SINGLE_BANNER
                                               sourceID:@"6395"];
            adView.delegate = self;
            [adView loadAD];

            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a single banner adview end

            UIImage* playerIdle2 = [UIImage imageNamed:@"image_down2.jpg"];

            _singleBannerPicturedownView = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight*0.75+ 66 + adSize.height, screenWidth, screenHeight - screenHeight*0.75 - adSize.height)];
            [_singleBannerPicturedownView setImage: playerIdle2];
            [self.view addSubview:_singleBannerPicturedownView];
        }

        else if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Banner_Wall"]) {
            NSLog(@"Initializing %@",[self.detailItem objectForKey:@"title"]);
            NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);
            CGRect viewFrame = self.view.frame;

            UIImage* bannerWallPictureUp = [UIImage imageNamed:@"image_up1.jpg"];

            _bannerWallPictureUpView = [[UIImageView alloc]initWithFrame:(CGRectZero)];

            _bannerWallPictureUpView.frame = CGRectMake(0, 66, screenWidth, screenHeight*0.5);

            [_bannerWallPictureUpView setImage: bannerWallPictureUp];

            [self.view addSubview:_bannerWallPictureUpView];

            //create a banner app wall adview start
            CGRect adFrame = CGRectMake((viewFrame.size.width - adSize.width) / 2, screenHeight*0.5 + 66, screenWidth, 200);

            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_BANNER_APPWALL
                                               sourceID:@"6395"];
            //set app count in banner app wall
            adView.appCount = 2;
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a banner app wall adview end

            UIImage* bannerWallPictureDown = [UIImage imageNamed:@"image_down1.jpg"];
            _bannerWallPictureDownView = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight*0.5 + 66 + 200, screenWidth, screenHeight - screenHeight*0.5- 200)];
            [_bannerWallPictureDownView setImage: bannerWallPictureDown];
            [self.view addSubview:_bannerWallPictureDownView];

        }
        else if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Single_RECT"]) {
            NSLog(@"Initializing %@",[self.detailItem objectForKey:@"title"]);
            NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);
            CGRect viewFrame = self.view.frame;

            UIImage* singlebuttonAppPictureUp = [UIImage imageNamed:@"image_up1.jpg"];

            _singlebuttonAppPictureUpView = [[UIImageView alloc]initWithFrame:(CGRectZero)];

            _singlebuttonAppPictureUpView.frame = CGRectMake(0, 66, screenWidth, screenHeight*0.5);

            [_singlebuttonAppPictureUpView setImage: singlebuttonAppPictureUp];

            [self.view addSubview:_singlebuttonAppPictureUpView];

            //create a single line button app wall adview start
            CGRect adFrame = CGRectMake((viewFrame.size.width - adSize.width) / 2, screenHeight*0.5 + 66, screenWidth, 240);

            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_SINGLE_BUTTON_APP_WALL
                                               sourceID:@"6395"];
            //setting app count and customize adview
            adView.appCount = 8;
            adView.isNeedReviewNumber = 0;
            adView.isNeedSize = 0;
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a single line button app wall adview end
            UIImage* singlebuttonAppPictureDown = [UIImage imageNamed:@"image_down1.jpg"];
            _bannerWallPictureDownView = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight*0.5 + 66 + 240, screenWidth, screenHeight - screenHeight*0.5- 240)];
            [_bannerWallPictureDownView setImage: singlebuttonAppPictureDown];
            [self.view addSubview:_bannerWallPictureDownView];
        }

        else if([[self.detailItem objectForKey:@"type"] isEqualToString:@"App_Wall"]) {
            NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
            
            UIImage* multiplebuttonAppWallPicture = [UIImage imageNamed:@"image_left1.jpg"];
            _multiplebuttonAppWallPicView = [[UIImageView alloc]initWithFrame:(CGRectZero)];

            _multiplebuttonAppWallPicView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height, landscapeFullscreenWidth*0.6, landscapeFullscreenHeight - self.navigationController.navigationBar.frame.size.height);
            [_multiplebuttonAppWallPicView setImage: multiplebuttonAppWallPicture];

            [self.view addSubview:_multiplebuttonAppWallPicView];

            //create a multiple line button app wall adview start
            CGRect adFrame = CGRectMake(landscapeFullscreenWidth*0.6, self.navigationController.navigationBar.frame.size.height, landscapeFullscreenWidth * 0.4 , landscapeFullscreenHeight - self.navigationController.navigationBar.frame.size.height);
            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_MULTIPLE_BUTTON_APP_WALL
                                               sourceID:@"6395"];
            adView.appCount = 8;
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
            //create a multiple line button app wall adview end
        }
        else if([[self.detailItem objectForKey:@"type"] isEqualToString:@"Transparent_Banner"]) {
            NSLog(@"Initializing %@",[self.detailItem objectForKey:@"title"]);

            NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

            UIImage* transparentBannerPicture = [UIImage imageNamed:@"game_back.jpg"];
            _transparentBannerPicView = [[UIImageView alloc]initWithFrame:(CGRectZero)];
            
            _transparentBannerPicView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height, landscapeFullscreenWidth, landscapeFullscreenHeight - self.navigationController.navigationBar.frame.size.height);

            [_transparentBannerPicView setImage: transparentBannerPicture];

            [self.view addSubview:_transparentBannerPicView];

            CGSize adSize = CGSizeFromString([self.detailItem objectForKey:@"dimension"]);
            //create a transparent adview start
            CGRect adFrame = CGRectMake((landscapeFullscreenWidth - adSize.width) / 2, landscapeFullscreenHeight * 0.65, adSize.width, adSize.height);
            self.title = [self.detailItem objectForKey:@"title"];
            adView = [[AvazuADView alloc] initWithFrame:adFrame
                                                 adType:AVAZU_TRANSPARENT_SINGLE_BANNER
                                               sourceID:@"6395"];
            adView.isNeedSize = 0;
            adView.transparentBannerAlpha = 50;
            adView.mainBackColor  = @"#000000";
            [adView loadAD];
            if(![self.view.subviews containsObject:adView]){
                [self.view addSubview:adView];
            }
        }
    }
}

- (void)configureView {
    if(adView) {
        adView.hidden = YES;
        [adView removeFromSuperview];
        adView = nil;
    }
    screenHeight = [UIScreen mainScreen].applicationFrame.size.height;
    screenWidth = [UIScreen mainScreen].applicationFrame.size.width;

    landscapeFullscreenHeight = [UIScreen mainScreen].bounds.size.width;
    landscapeFullscreenWidth  = [UIScreen mainScreen].bounds.size.height;

    [self loadAdRequest];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    statusLabel.hidden = YES;
    [self configureView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Avazu iOS SDK", @"Avazu iOS SDK");
    }
    return self;
}

#pragma avazuADViewDelegate

- (void)avazuADViewLoadAdSucess:(AvazuADView *)adview
{
    NSLog(@"avazuADViewLoadAdSucess");
}
- (void)avazuADView:(AvazuADView *)adview didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"avazuADViewLoadAdFail");
    NSLog(@"error:%@", error);
}

#pragma dealloc
-(void)dealloc {
    self.adView.delegate = nil;
}

@end
