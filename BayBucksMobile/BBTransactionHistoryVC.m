//
//  BBTransactionHistoryVC.m
//  BayBucksMobile
//
//  Created by WM on 6/8/13.
//  Copyright (c) 2013 BayBucks. All rights reserved.
//

#import "BBTransactionHistoryVC.h"

#import "BBNearbyVC.h"
#import "BBOnboardingVC.h"
#import "BBDetailVC.h"


@interface BBTransactionHistoryVC ()


@property UITableView *nearbyTableView;
@property MKMapView *nearbyMapView;
@property UISearchBar *merchantSearchBar;
@property CLLocationManager *locationManager;

@end

@implementation BBTransactionHistoryVC

@synthesize nearbyTableView;
@synthesize nearbyMapView;
@synthesize merchantSearchBar;
@synthesize locationManager;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"Transaction History";
	
	// if first login
	BBOnboardingVC *onboardingVC = [[BBOnboardingVC alloc] init];
	UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:onboardingVC];
	[self presentViewController:navCon animated:NO completion:nil];
	
	[self setupTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	NSIndexPath *selectionPath = [nearbyTableView indexPathForSelectedRow];
	if(selectionPath) [nearbyTableView deselectRowAtIndexPath:selectionPath animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

#pragma mark - View setup

- (void)setupTableView
{
	self.nearbyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height - 44) style:UITableViewStylePlain]; // CGRectMake(0, 150 + 40, self.view.bounds.size.width, self.view.bounds.size.height - 190 - 44)
	nearbyTableView.rowHeight = 90;
	nearbyTableView.delegate = self;
	nearbyTableView.dataSource = self;
	[self.view addSubview:nearbyTableView];
}

#pragma mark - User Action methods
// other user actions here


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    BBNearbyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[BBNearbyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
	cell.merchantName.text = @"Taco Loco";
	cell.locationLabel.text = @"745 First St.";
	cell.cellImageView.image = [UIImage imageNamed:@"whiteCart 2"];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
	headerView.backgroundColor = [UIColor turquoiseColor];
	
	UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 20, 25)];
	headerTitle.backgroundColor = [UIColor clearColor];
	headerTitle.font = [UIFont boldFlatFontOfSize:16];
	headerTitle.textColor = [UIColor cloudsColor];
	headerTitle.shadowColor = [UIColor greenSeaColor];
	headerTitle.shadowOffset = CGSizeMake(1.0, 1.0);
	headerTitle.text = @"Establishments:";
	
	[headerView addSubview:headerTitle];
	return headerView;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// do something
	
	
}

@end
