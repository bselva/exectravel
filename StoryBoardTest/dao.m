//
//  dao.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "dao.h"

@implementation Flight
@synthesize origin, destination, departureTime, arrivalTime, aircraft, duration, seat, className;

- (void) dealloc {
    //[self prop1:nil];
    //[super dealloc];
}
@end

@implementation Airport
@synthesize lat, lon, name, continent, iata;

- (NSString *) fullName {
    return [NSString stringWithFormat:@"%@ %@", [self iata], [self name]];
}

- (void) dealloc {
    //[self prop1:nil];
    //[super dealloc];
}
@end

@implementation Voucher
@synthesize iataOrigin, iataDestination;

- (void) dealloc {
    //[super dealloc];
}
@end