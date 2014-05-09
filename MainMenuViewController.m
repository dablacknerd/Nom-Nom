//
//  MainMenuViewController.m
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import "MainMenuViewController.h"
#import <MapKit/MapKit.h>
#import "NOMRestuarantList.h"
#import "NOMResultTableViewController.h"
@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLoc
          fromLocation:(CLLocation *)oldLocation
{
    newLocation = newLoc;
    initialLocation =oldLocation;
}

- (IBAction)findRestuarants:(id)sender {
    [_searchField resignFirstResponder];
    NOMRestuarantList *p = [NOMRestuarantList sharedList];
    [[p allRestuarants] removeAllObjects];
    [self performSearch];
}

- (IBAction)clearSearchField:(id)sender {
    _searchField.text =@" ";
    
}

-(void)performSearch
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 8407, 8407);
    MKLocalSearchRequest *restuarantRequest = [[MKLocalSearchRequest alloc] init];
    NSMutableString *searchQuery = [[NSMutableString alloc] initWithString:_searchField.text];
    restuarantRequest.naturalLanguageQuery = searchQuery;
    NSLog(@"%@",searchQuery);
    restuarantRequest.region = region;
    MKLocalSearch *searchBody = [[MKLocalSearch alloc] initWithRequest:restuarantRequest];
    
    [searchBody startWithCompletionHandler:^(MKLocalSearchResponse
                                             *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                CLLocationDistance distanceBetween = [initialLocation
                                                      distanceFromLocation:newLocation];
                NSMutableString *rname = [item.name copy];
                NSMutableString *pnumber = [item.phoneNumber copy];
                [[NOMRestuarantList sharedList] createRestuarant:item.placemark.coordinate
                    restuarantName:rname
                    phone:pnumber
                    distance:&distanceBetween
                    mapItem:item
                    address:item.placemark.addressDictionary];
                //CLLocationDistance distanceBetween = [initialLocation
                //distanceFromLocation:newLocation];
                /*NomRestuarantItem *result =[[NomRestuarantItem alloc]
                 initWithCoordinate:item.placemark.coordinate
                 restuarantName:item.name
                 phone:item.phoneNumber
                 distance:&distanceBetween];
                 [_restuarantList addObject:result];*/
                //NSLog(@"%@ is %f miles from you",result.restuarantName,result.distance);
                
            }
        //NSLog(@"%lu",(unsigned long)[_restuarantList count]);
        NOMResultTableViewController *resultTable = [[NOMResultTableViewController alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:resultTable];
        [self presentViewController:navController animated:YES completion:nil];
    }];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    _searchField.text =@" ";
}

-(void)viewWillAppear:(BOOL)animated
{
    _searchField.placeholder =@" Restuarnt  Name or Food type....";
}
@end
