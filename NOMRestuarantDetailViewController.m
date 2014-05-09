//
//  NOMRestuarantDetailViewController.m
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/9/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import "NOMRestuarantDetailViewController.h"
#import "NOMResultTableViewController.h"
#import "NOMRestuarant.h"
#import <AddressBook/AddressBook.h>
@interface NOMRestuarantDetailViewController ()

@end

@implementation NOMRestuarantDetailViewController
@synthesize restuarant,dismissBlock;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    @throw[NSException exceptionWithName:@"Wrong initializer" reason:@"Use initForNewItem" userInfo:nil];
    return nil;
}

-(id)initForNewitem:(BOOL)isNew
{
    self = [super initWithNibName:@"NOMRestuarantDetailViewController" bundle:nil];
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *clr = nil;
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        clr =[UIColor colorWithRed:0.875 green:0.88 blue:0.91 alpha:1.0];
    }
    else
    {
        clr = [UIColor groupTableViewBackgroundColor];
    }
    [[self view] setBackgroundColor:clr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (IBAction)goBackToResults:(id)sender {
    //NOMResultTableViewController *x = [[NOMResultTableViewController alloc] init];
    //UINavigationController *navController =[[UINavigationController alloc] initWithRootViewController:x];
    //[self presentViewController:navController animated:YES completion:_dismissBlock];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}*/


- (IBAction)getMapDirections:(id)sender {
    NOMRestuarant *r = restuarant;
    //MKMapItem *mapItem = r.mapItem
    
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving};
    [r.mapItem openInMapsWithLaunchOptions:options];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //NSMutableString *cityAndState = [[NSMutableString alloc] initWithString:(@" %@ %@",city, state)];
    
    [_addressOneTextField setText:[restuarant.addressDictionary objectForKey: (NSString *)kABPersonAddressStreetKey]];
    //[_cityAndStateTextField setText:cityAndState];
    [_cityTextField setText:[restuarant.addressDictionary objectForKey: (NSString *)kABPersonAddressCityKey]];
    [_stateTextField setText:[restuarant.addressDictionary objectForKey: (NSString *)kABPersonAddressStateKey]];
    [_zipcodeTextField setText: [restuarant.addressDictionary objectForKey: (NSString *)kABPersonAddressZIPKey]];
    [_phoneNumberTextField setText:restuarant.phoneNumber];
}
-(void)setItem:(NOMRestuarant *)i
{
    restuarant = i;
    [[self navigationItem] setTitle:[restuarant restuarantName]];
}

@end
