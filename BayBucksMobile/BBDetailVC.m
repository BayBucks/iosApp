//
//  BBDetailVC.m
//  BayBucksMobile
//
//  Created by WM on 6/8/13.
//  Copyright (c) 2013 BayBucks. All rights reserved.
//

#import "BBDetailVC.h"

@interface BBDetailVC ()

@property UIScrollView *backgroundScrollView;
@property UITextField *amountTextField;

@end

@implementation BBDetailVC

@synthesize backgroundScrollView;
@synthesize amountTextField;


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
	
	self.title = @"Some establishment!";
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(confirmButtonPressed)];
	
	[self setupUI];
	
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	if([amountTextField isFirstResponder]) [amountTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupUI
{
	self.backgroundScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	backgroundScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1000); // TEMP
	backgroundScrollView.backgroundColor = [UIColor cloudsColor];
	[self.view addSubview:backgroundScrollView];
	
	
	// Establishment description section - 1st ~100 pixels
//	UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 320, 100)];
//	backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
//	[backgroundImageView setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"cookierebels"]];
//	[backgroundScrollView addSubview:backgroundImageView];
	
	UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
	backgroundView.backgroundColor = [UIColor carrotColor];
	[backgroundScrollView addSubview:backgroundView];
	
	UIImageView *categoryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 10, 30, 30)];
	categoryImageView.backgroundColor = [UIColor clearColor];
	//	categoryImageView.image = [UIImage imageNamed:activeRecipe.]; // TEMP
	[backgroundScrollView addSubview:categoryImageView];

	
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 250, 40)];
	nameLabel.font = [UIFont boldFlatFontOfSize:30];
	nameLabel.textColor = [UIColor cloudsColor];
	nameLabel.backgroundColor = [UIColor clearColor];
	nameLabel.shadowColor = [UIColor darkGrayColor];
	nameLabel.shadowOffset = CGSizeMake(1, 1);
	nameLabel.text = @"Joe's shoes";
	[backgroundScrollView addSubview:nameLabel];
	
	UILabel *taglineLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 250, 30)];
	taglineLabel.font = [UIFont boldFlatFontOfSize:15];
	taglineLabel.textColor = [UIColor cloudsColor];
	taglineLabel.backgroundColor = [UIColor clearColor];
	taglineLabel.shadowColor = [UIColor darkGrayColor];
	taglineLabel.shadowOffset = CGSizeMake(1, 1);
	taglineLabel.text = @"Shoes when you want them!"; // TEMP
	[backgroundScrollView addSubview:taglineLabel];
	
	UILabel *priceRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 50, 100, 30)];
	priceRangeLabel.font = [UIFont boldFlatFontOfSize:20];
	priceRangeLabel.textColor = [UIColor cloudsColor];
	priceRangeLabel.backgroundColor = [UIColor clearColor];
	priceRangeLabel.shadowColor = [UIColor darkGrayColor];
	priceRangeLabel.shadowOffset = CGSizeMake(1, 1);
	priceRangeLabel.textAlignment = NSTextAlignmentRight;
	priceRangeLabel.text = @"$$$";
	[backgroundScrollView addSubview:priceRangeLabel];
	
	
	// Setup text field inputs
	UILabel *availableBayBucksLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 240, 30)];
	availableBayBucksLabel.backgroundColor = [UIColor clearColor];
 	availableBayBucksLabel.text = @"Available Bay Bucks:";
	availableBayBucksLabel.font = [UIFont flatFontOfSize:20];
	[backgroundScrollView addSubview:availableBayBucksLabel];
	
	UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 110, 120, 30)];
	numberLabel.backgroundColor = [UIColor clearColor];
	numberLabel.text = @"$100";
	numberLabel.textAlignment = NSTextAlignmentRight;
	numberLabel.font = [UIFont boldFlatFontOfSize:20];
	[backgroundScrollView addSubview:numberLabel];
	
	UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 160, 30)];
	amountLabel.backgroundColor = [UIColor clearColor];
	amountLabel.text = @"Amount to send:";
	amountLabel.font = [UIFont flatFontOfSize:20];
	[backgroundScrollView addSubview:amountLabel];
	
	self.amountTextField = [[UITextField alloc] initWithFrame:CGRectMake(190, 150, 120, 30)];
	amountTextField.backgroundColor = [UIColor asbestosColor];
	amountTextField.delegate = self;
	amountTextField.font = [UIFont flatFontOfSize:20];
	amountTextField.borderStyle = UITextBorderStyleBezel;
	amountTextField.textAlignment = NSTextAlignmentRight;
	amountTextField.keyboardType = UIKeyboardTypeDecimalPad;
	[amountTextField becomeFirstResponder];
	amountTextField.placeholder = @"$0.00";
	[backgroundScrollView addSubview:amountTextField];
	
	// Setup buttons
	FUIButton *mockButton = [[FUIButton alloc] initWithFrame:CGRectMake(0, 210, 140, 40)];
	mockButton.center = CGPointMake(self.view.center.x, mockButton.center.y);
	mockButton.buttonColor = [UIColor turquoiseColor];
	mockButton.shadowColor = [UIColor greenSeaColor];
	mockButton.shadowHeight = 3.0f;
	mockButton.cornerRadius = 6.0f;
	[mockButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
	[mockButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
	[mockButton addTarget:self action:@selector(confirmButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	[mockButton setTitle:@"Make payment" forState:UIControlStateNormal];
	[backgroundScrollView addSubview:mockButton];	
}


#pragma mark - User Action methods
- (void)confirmButtonPressed
{

	// server stuff
	// push confirmation VC
	
	[self.navigationController popToRootViewControllerAnimated:YES];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Huzzah" message:@"Congrats! You've sent some cash money to some person!" delegate:self cancelButtonTitle:@"Hooah!" otherButtonTitles:nil];
	[alert show]; // TEMP obviously
	
	if([amountTextField isFirstResponder]) [amountTextField resignFirstResponder];
}


@end
