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
