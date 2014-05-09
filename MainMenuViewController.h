//
//  MainMenuViewController.h
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MainMenuViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *newLocation;
    CLLocation *initialLocation;
}
@property (weak, nonatomic) IBOutlet UITextField *searchField;
- (IBAction)findRestuarants:(id)sender;

- (IBAction)clearSearchField:(id)sender;

@end
