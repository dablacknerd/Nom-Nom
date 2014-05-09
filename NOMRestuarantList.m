//
//  NOMRestuarantList.m
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import "NOMRestuarantList.h"
#import <MapKit/MapKit.h>
@implementation NOMRestuarantList

+(NOMRestuarantList *)sharedList
{
    static NOMRestuarantList *sharedList = nil;
    if(!sharedList){
        sharedList =[[super allocWithZone:nil] init];
    }
    return sharedList;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedList];
}

-(id) init
{
    self = [super init];
    if(self){
        allRestuarants = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSArray *)allRestuarants
{
    return allRestuarants;
}

-(NOMRestuarant *)createRestuarant: (CLLocationCoordinate2D)c restuarantName:(NSMutableString *)t phone:(NSMutableString *)p distance:(CLLocationDistance *)d mapItem:(MKMapItem *)m
     address:(NSDictionary *) a
{
    NOMRestuarant*r = [[NOMRestuarant alloc] initWithCoordinate:c
                                                          restuarantName:t
                                                                   phone:p
                                                                distance:d
                                                                 mapItem:m
                                                                 address:a];
    [allRestuarants addObject:r];
    return r;
}
@end
