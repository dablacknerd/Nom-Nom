//
//  NOMRestuarantCell.m
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import "NOMRestuarantCell.h"
#import "NOMRestuarantList.h"
#import "NOMRestuarant.h"
#import "NOMRestuarantDetailViewController.h"
#import <MapKit/MapKit.h>
@implementation NOMRestuarantCell
@synthesize controller,tableView;

/*- (IBAction)mapDirections:(id)sender
{
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    NOMRestuarantList *p =[NOMRestuarantList sharedList];
    NOMRestuarant *r = [[p allRestuarants] objectAtIndex:[indexPath row]];
    //MKMapItem *mapItem = r.mapItem;
    
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving};
    [r.mapItem openInMapsWithLaunchOptions:options];
}

- (IBAction)showDetails:(id)sender {
    NOMRestuarantDetailViewController *d = [[NOMRestuarantDetailViewController alloc] initForNewitem:NO];
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    NOMRestuarantList *p =[NOMRestuarantList sharedList];
    NOMRestuarant *r = [[p allRestuarants] objectAtIndex:[indexPath row]];
    
    [d setRestuarant:r];
    [d setDismissBlock:^{[[self tableView] reloadData];}];
    UINavigationController *navController =[[UINavigationController alloc] initWithRootViewController:d];
    [[self window] setRootViewController:navController];

}*/
@end
