//
//  BBNearbyVC.h
//  BayBucksMobile
//
//  Created by WM on 6/8/13.
//  Copyright (c) 2013 BayBucks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BBNearbyCell.h"

@interface BBNearbyVC : UIViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, CLLocationManagerDelegate>

@end
