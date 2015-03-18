//
//  AvazuSampleDetailViewController.h
//

#import <UIKit/UIKit.h>

#import "AvazuADView.h"


@interface AvazuSampleDetailViewController : UIViewController <AvazuADViewDelegate>

@property (strong, nonatomic) AvazuADView *adView;

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIView *statusView;

@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
