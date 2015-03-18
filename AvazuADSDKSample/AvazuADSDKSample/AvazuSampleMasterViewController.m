//
//  TAMasterViewController.m
//  Test Application
//

#import "AvazuSampleDetailViewController.h"

#import "AvazuSampleMasterViewController.h"

@interface AvazuSampleMasterViewController ()
{
    NSArray *_objects;
}

@end

@implementation AvazuSampleMasterViewController

@synthesize detailViewController = _detailViewController;

#pragma mark - UIViewController life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Avazu iOS SDK", @"Avazu iOS SDK");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.preferredContentSize = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *plistPath = nil;
    
    plistPath = [[NSBundle mainBundle] pathForResource:@"PublisherDemo-AdSizes" ofType:@"plist"];
    
    _objects = [NSArray arrayWithContentsOfFile:plistPath];

}

-(void)viewWillAppear:(BOOL)animated
{
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_objects count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
    return @"Supported Ad Formats";
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] 
                                  initWithTitle: @"Back" 
                                  style:UIBarButtonItemStylePlain
                                  target: nil action: nil];
    
    [self.navigationItem setBackBarButtonItem: backButton];
    
    NSDictionary *demoCompontent = [_objects objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [demoCompontent objectForKey:@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *demoCompontent = [_objects objectAtIndex:indexPath.row];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        AvazuSampleDetailViewController* detailViewController = [[AvazuSampleDetailViewController alloc] initWithNibName:@"TADetailViewController_iPhone" bundle:nil];
	    detailViewController.detailItem = demoCompontent;
        [self.navigationController pushViewController:detailViewController animated:YES];
    } else {
        self.detailViewController.detailItem = demoCompontent;
    }
}

@end
