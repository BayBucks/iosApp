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
@property UISearchBar *searchBar;

@end

@implementation BBNearbyVC

@synthesize nearbyTableView;
@synthesize nearbyMapView;
@synthesize searchBar;


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

	self.title = @"Baybucks around you";
	
	// if first login
	BBOnboardingVC *onboardingVC = [[BBOnboardingVC alloc] init];
	UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:onboardingVC];
	[self presentViewController:navCon animated:NO completion:nil];
	
	[self setupSearchBar];
	[self setupMapView];
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

#pragma mark - View setup

- (void)setupSearchBar
{
	self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
	searchBar.placeholder = @"Find participating shops...";
	searchBar.delegate = self;
	[self.view addSubview:searchBar];
	
}

- (void)setupMapView
{
	self.nearbyMapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 150)];
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
	self.nearbyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150 + 40, self.view.bounds.size.width, self.view.bounds.size.height - 150 - 40 - 44) style:UITableViewStylePlain];
	nearbyTableView.rowHeight = 90;
	nearbyTableView.delegate = self;
	nearbyTableView.dataSource = self;
	[self.view addSubview:nearbyTableView];
}

#pragma mark - User Action methods







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
    
    // Configure the cell...

	cell.merchantName.text = @"Taco Loco";
	cell.locationLabel.text = @"745 First St.";
	cell.cellImageView.image = [UIImage imageNamed:@"cookierebels"];
	
//	cell.textLabel.text = @"Ron Paul would love Bay Bucks";
//	cell.detailTextLabel.text = @"Tho he prefers gold, obviously";
//	cell.imageView.image = [UIImage imageNamed:@"cookierebels"];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Establishments:";
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	BBDetailVC *detailVC = [[BBDetailVC alloc] init];
	[self.navigationController pushViewController:detailVC animated:YES];
	
	
}

@end
