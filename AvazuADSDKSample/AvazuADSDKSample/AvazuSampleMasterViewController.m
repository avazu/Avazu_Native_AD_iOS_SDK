//
//  TAMasterViewController.m
//

#import "AvazuSampleDetailViewController.h"

#import "AvazuSampleMasterViewController.h"

#import "AvazuSampleDetailLandscapeViewCtroller.h"

#import "AvazuCustomizedBannerSettingViewController.h"

#import "AvazuCustomizedButtonAppWallSettingViewController.h"

@interface AvazuSampleMasterViewController ()
{
    NSArray *_bannerobjects;
    NSArray *_appwallobjects;
}

@end

@implementation AvazuSampleMasterViewController

@synthesize detailViewController = _detailViewController;

#pragma mark - UIViewController life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Avazu Native Ad Demo for iOS", @"Avazu Native Ad Demo for iOS");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *plistPath = nil;
    
    NSString *plistPath2 = nil;
    
    plistPath = [[NSBundle mainBundle] pathForResource:@"Avazu-Appwalls" ofType:@"plist"];
    
    plistPath2 = [[NSBundle mainBundle] pathForResource:@"Avazu-Banners" ofType:@"plist"];
    
    _bannerobjects = [NSArray arrayWithContentsOfFile:plistPath2];
    
    _appwallobjects = [NSArray arrayWithContentsOfFile:plistPath];

}

- (void)viewWillAppear:(BOOL)animated
{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    [super viewWillAppear:animated];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 4;
    }
    else {
        return 3;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{

    if(section == 0) {
        return @"Banner AD";
    }
    else
    {
        return @"Button AD";
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] 
                                  initWithTitle: @"Back" 
                                  style:UIBarButtonItemStylePlain
                                  target: nil action: nil];
    
    [self.navigationItem setBackBarButtonItem: backButton];

    if (indexPath.section==0) {
            NSDictionary *demoCompontent = [_bannerobjects objectAtIndex:indexPath.row];
            cell.textLabel.text = [demoCompontent objectForKey:@"title"];
    }
    else {
            NSDictionary *demoCompontent = [_appwallobjects objectAtIndex:indexPath.row];
            cell.textLabel.text = [demoCompontent objectForKey:@"title"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *demoCompontent;
    if (indexPath.section==0) {
        demoCompontent = [_bannerobjects objectAtIndex:indexPath.row];
        if (indexPath.row == 3) {
            AvazuCustomizedBannerSettingViewController* customizedBannerViewController = [[AvazuCustomizedBannerSettingViewController alloc] initWithNibName:@"AvazuCustomizedBannerSettingViewController" bundle:nil];
            [self.navigationController pushViewController:customizedBannerViewController animated:YES];
        }

        else if (indexPath.row == 1) {
            AvazuSampleDetailLandscapeViewCtroller* detailLandscapeViewController = [[AvazuSampleDetailLandscapeViewCtroller alloc] initWithNibName:@"TADetailViewController_iPhone" bundle:nil];
            detailLandscapeViewController.detailItem = demoCompontent;
            [self.navigationController pushViewController:detailLandscapeViewController animated:YES];
        }
        else {
            AvazuSampleDetailViewController* detailViewController = [[AvazuSampleDetailViewController alloc] initWithNibName:@"TADetailViewController_iPhone" bundle:nil];
            detailViewController.detailItem = demoCompontent;
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
        
    }
    else {
        demoCompontent = [_appwallobjects objectAtIndex:indexPath.row];
        if (indexPath.row == 2) {
            AvazuCustomizedButtonAppWallSettingViewController* customizedButtonAppwallViewController = [[AvazuCustomizedButtonAppWallSettingViewController alloc] initWithNibName:@"AvazuCustomizedButtonAppWallSettingViewController" bundle:nil];
            [self.navigationController pushViewController:customizedButtonAppwallViewController animated:YES];
        }
        else if (indexPath.row == 1) {
            AvazuSampleDetailLandscapeViewCtroller* detailLandscapeViewController = [[AvazuSampleDetailLandscapeViewCtroller alloc] initWithNibName:@"TADetailViewController_iPhone" bundle:nil];
            detailLandscapeViewController.detailItem = demoCompontent;
            [self.navigationController pushViewController:detailLandscapeViewController animated:YES];
        }
        else {
            AvazuSampleDetailViewController* detailViewController = [[AvazuSampleDetailViewController alloc] initWithNibName:@"TADetailViewController_iPhone" bundle:nil];
            detailViewController.detailItem = demoCompontent;
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
    }
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}


@end
