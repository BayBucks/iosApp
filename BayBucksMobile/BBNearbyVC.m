//
//  BBNearbyVC.m
//  BayBucksMobile
//
//  Created by WM on 6/8/13.
//  Copyright (c) 2013 BayBucks. All rights reserved.
//

#import "BBNearbyVC.h"

#import "BBOnboardingVC.h"

@interface BBNearbyVC ()

@end

@implementation BBNearbyVC

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

	
	// if first login
	BBOnboardingVC *onboardingVC = [[BBOnboardingVC alloc] init];
	UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:onboardingVC];
	[self presentViewController:navCon animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
