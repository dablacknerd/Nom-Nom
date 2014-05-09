//
//  NOMRestuarant.h
//  Nom Nom
//
//  Created by Adetomiwa Oguntuga on 1/5/14.
//  Copyright (c) 2014 blaknerd development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface NOMRestuarant : NSObject
{
    
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)c restuarantName:(NSMutableString *)t phone:(NSMutableString *)p distance:(CLLocationDistance *)d mapItem:(MKMapItem *)m
    address:(NSDictionary *)a;
@property(nonatomic,readonly) CLLocationCoordinate2D coordinates;
@property(nonatomic,readwrite,strong) NSMutableString *restuarantName;
@property(nonatomic,readwrite,strong) NSMutableString *phoneNumber;
@property(nonatomic,readwrite,assign) CLLocationDistance distance;
@property(nonatomic,readwrite)MKMapItem *mapItem;
@property(nonatomic,readwrite)NSDictionary *addressDictionary;
@end
