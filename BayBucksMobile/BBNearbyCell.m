//
//  BBNearbyCell.m
//  BayBucksMobile
//
//  Created by WM on 6/8/13.
//  Copyright (c) 2013 BayBucks. All rights reserved.
//

#import "BBNearbyCell.h"

@implementation BBNearbyCell

@synthesize merchantName;
@synthesize locationLabel;
@synthesize cellImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI
{
	self.contentView.backgroundColor = [UIColor cloudsColor];
	
	self.merchantName = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 210, 30)];
	merchantName.backgroundColor = [UIColor clearColor];
	merchantName.font = [UIFont boldFlatFontOfSize:16];
	[self.contentView addSubview:merchantName];
	
	self.locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 35, 210, 30)];
	locationLabel.backgroundColor = [UIColor clearColor];
	locationLabel.font = [UIFont flatFontOfSize:14];
	[self.contentView addSubview:locationLabel];
	
	self.cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 80, 80)];
	cellImageView.backgroundColor = [UIColor sunflowerColor];
	cellImageView.contentMode = UIViewContentModeScaleToFill;
	[self.contentView addSubview:cellImageView];

}

@end
