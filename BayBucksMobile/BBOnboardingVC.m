//
//  BBOnboardingVC.m
//  BayBucksMobile
//
//  Created by WM on 6/8/13.
//  Copyright (c) 2013 BayBucks. All rights reserved.
//

#import "BBOnboardingVC.h"

@interface BBOnboardingVC ()

@end

@implementation BBOnboardingVC

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
	
	self.title = @"Bienvenue!";
	self.view.backgroundColor = [UIColor belizeHoleColor];
	
	UITextView *onboarding = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
	onboarding.center = self.view.center;
	onboarding.backgroundColor = [UIColor clearColor];
	onboarding.text = @"This is where the onboarding would go!";
	onboarding.textAlignment = NSTextAlignmentCenter;
	onboarding.textColor = [UIColor cloudsColor];
	onboarding.font = [UIFont boldFlatFontOfSize:30];
	[self.view addSubview:onboarding];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(dropOnboarding)];
	// Do any additional setup after loading the view.
	
	[self setupAPITestButtons];
}

- (void)setupAPITestButtons
{
	// this is a test UI for testing the various API calls as they come in. super temp
	
	
}

- (void)testPostSession
{
	NSString * kUserName = @""; // collect this from the user
	NSString * kPassword = @""; // collect this from the user
	NSString * keyString = @"";

	[[BayBucksMobileAPIClient sharedClient] postPath:[NSString stringWithFormat:@"session.json?site_key=%@", keyString]
										  parameters:[NSDictionary dictionaryWithObjectsAndKeys:
													  kUserName, @"login",
													  kPassword, @"password",
													  nil]
											 success:^(AFHTTPRequestOperation *operation, id responseObject) {
												 NSLog(@"Success: POST SESSION %@", responseObject);
											 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
												 NSLog(@"Failure: POST SESSION %@", error);
											 }];
}

- (void)testGetAccountStatus
{
	// temp
	[[BayBucksMobileAPIClient sharedClient] getPath:[NSString stringWithFormat:@"account.json?key=%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"user_session_key"]]
										 parameters:nil
											success:^(AFHTTPRequestOperation *operation, id responseObject) {
												NSLog(@"Success: ACCOUNT STATUS %@", responseObject);
											} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
												NSLog(@"Failure: ACCOUNT STATUS %@", error);
											}];
}

- (void)testGetTransactionHistory
{
	/*
	 GET request to https://yoursubdomain.nextrade360.com/api/v1/account/history/FROM/TILL.json
	 Path parameters:
	 FROM: Period begin date coded as YYYY­MM­DD
	 TILL: Period end date coded as YYYY­MM­DD.
	 Parameters: none.
	 Response array: objects for transactions in the requested period
	 */
	NSString *fromString = @"20130101";
	NSString *tilString = @"20140101";
	
	[[BayBucksMobileAPIClient sharedClient] getPath:[NSString stringWithFormat:@"account/history/%@/%@.json?key=%@", fromString, tilString, [[NSUserDefaults standardUserDefaults] objectForKey:@"user_session_key"]]
										 parameters:nil
											success:^(AFHTTPRequestOperation *operation, id responseObject) {
												NSLog(@"Success: TRANSACTION HISTORY %@", responseObject);
											} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
												NSLog(@"Failure: TRANSACTION HISTORY %@", error);
											}];
}

- (void)testPostSalePosting
{
	
	[[BayBucksMobileAPIClient sharedClient] postPath:[NSString stringWithFormat:@"account/sale.json?key=%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"user_session_key"]]
										 parameters:[NSDictionary dictionaryWithObjectsAndKeys:
													 @"", @"account_number",
													 @"", @"trade_amount",
													 @"", @"description",
													 nil]
											success:^(AFHTTPRequestOperation *operation, id responseObject) {
												NSLog(@"Success: SALE POSTING %@", responseObject);
											} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
												NSLog(@"Failure: SALE POSTING %@", error);
											}];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dropOnboarding
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
