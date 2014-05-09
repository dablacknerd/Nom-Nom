//
//  NOMRestuarant.m
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import "NOMRestuarant.h"

@implementation NOMRestuarant
@synthesize restuarantName,distance,phoneNumber,coordinates,mapItem,addressDictionary;
-(id)initWithCoordinate:(CLLocationCoordinate2D)c restuarantName:(NSMutableString *)t phone:(NSMutableString *)p distance:(CLLocationDistance *)d mapItem:(MKMapItem *)m
    address:(NSDictionary *)a;
{
    self = [super init];
    if(self)
    {
        coordinates = c;
        [self setRestuarantName:t];
        [self setPhoneNumber:p];
        [self setDistance:*d];
        [self setMapItem:m];
        [self setAddressDictionary:a];
    }
    return self;
}

@end
