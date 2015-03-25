//
//  AppDelegate.h


#import <UIKit/UIKit.h>
#import "AvazuNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AvazuNavigationController *navigationController;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@end

