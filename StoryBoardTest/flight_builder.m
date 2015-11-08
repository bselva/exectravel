//
//  flight_builder.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FlightBuilder : NSObject

+ (NSArray *)flightsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end