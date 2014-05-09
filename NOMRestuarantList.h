//
//  NOMRestuarantList.h
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NOMRestuarant.h"
@interface NOMRestuarantList : NSObject
{
    NSMutableArray *allRestuarants;
}

+(NOMRestuarantList *)sharedList;
-(NSMutableArray *)allRestuarants;
-(NOMRestuarant *)createRestuarant: (CLLocationCoordinate2D)c restuarantName:(NSMutableString *)t phone:(NSMutableString *)p distance:(CLLocationDistance *)d mapItem:(MKMapItem *)m
    address:(NSDictionary *) a;
@end
