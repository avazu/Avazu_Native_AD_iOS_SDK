//
//  AvazuSampleDetailViewController.h
//

#import <UIKit/UIKit.h>

#import "AvazuADView.h"


@interface AvazuSampleDetailViewController : UIViewController <AvazuADViewDelegate>

@property (strong, nonatomic) AvazuADView *adView;

@property (strong, nonatomic) id detailItem;

@end
