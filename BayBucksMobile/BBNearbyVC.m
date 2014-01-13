//
//  BBNearbyVC.m
//  BayBucksMobile
//
//  Created by WM on 6/8/13.
//  Copyright (c) 2013 BayBucks. All rights reserved.
//

#import "BBNearbyVC.h"
#import "BBOnboardingVC.h"
#import "BBDetailVC.h"


@interface BBNearbyVC ()

@property UITableView *nearbyTableView;
@property MKMapView *nearbyMapView;
@property UISearchBar *merchantSearchBar;
@property CLLocationManager *locationManager;

@end

@implementation BBNearbyVC

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

	self.title = @"BayBuckz";
	
	// if first login
	BBOnboardingVC *onboardingVC = [[BBOnboardingVC alloc] init];
	UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:onboardingVC];
	[self presentViewController:navCon animated:NO completion:nil];
	
	[self setupMapView]; // Map turned off until location information available
	[self setupSearchBar];
	[self setupTableView];
	
	self.locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	[locationManager startUpdatingLocation];
		
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
	[locationManager stopUpdatingLocation];
}

#pragma mark - View setup

- (void)setupSearchBar
{
	self.merchantSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
	merchantSearchBar.placeholder = @"Find participating shops...";
	merchantSearchBar.delegate = self;
	merchantSearchBar.backgroundColor = [UIColor carrotColor];
	[self.view addSubview:merchantSearchBar];
	
	// Flip through the searchBar subviews to remove the search bar background.
	for (UIView *subview in merchantSearchBar.subviews) {
		if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
			[subview removeFromSuperview];
			break;
		}
	}
}

- (void)setupMapView
{
	self.nearbyMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 190)];
	nearbyMapView.delegate = self;
	nearbyMapView.userInteractionEnabled = YES;
	nearbyMapView.showsUserLocation = YES;
	nearbyMapView.scrollEnabled = YES;
	nearbyMapView.mapType = MKMapTypeStandard;
	nearbyMapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.0, -122.0), MKCoordinateSpanMake(0.50, 0.50));
	[self.view addSubview:nearbyMapView];
}

- (void)setupTableView
{
	self.nearbyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150 + 40, self.view.bounds.size.width, self.view.bounds.size.height -  190) style:UITableViewStylePlain]; // CGRectMake(0, 150 + 40, self.view.bounds.size.width, self.view.bounds.size.height - 190 - 44)
	nearbyTableView.rowHeight = 90;
	nearbyTableView.delegate = self;
	nearbyTableView.dataSource = self;
	[self.view addSubview:nearbyTableView];
}

#pragma mark - User Action methods
// Searchbar stuff here

#pragma mark - SearchBar Delegate methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
}

//- (UISearchDisplayController *)searchDisplayController // Definitely use this!!!


#pragma mark - CLLocationManager
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
//	nearbyMapView.region = MKCoordinateRegionMake(locationManager.location.coordinate, MKCoordinateSpanMake(0.05, 0.05));
	[nearbyMapView setRegion:MKCoordinateRegionMake(locationManager.location.coordinate, MKCoordinateSpanMake(0.05, 0.05)) animated:YES];
	
	// temp - we need to turn this off lest it drain the battery.
}

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
	BBDetailVC *detailVC = [[BBDetailVC alloc] init];
	[self.navigationController pushViewController:detailVC animated:YES];
	
}

@end
