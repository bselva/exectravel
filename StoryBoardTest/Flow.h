//
//  Flow.h
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dao.h"

@interface Flow : NSObject {
  
    
}

@property   NSArray *allFlights;
@property   NSArray *allAirports;
@property   NSArray *allVouchers;
@property   UserData *userData;
@property   NSDictionary* indexedAirports;

@property   NSDate* selectedDate;
@property   NSString* selectedDestination;
@property   Flight* selectedFlight;


+ (id)sharedFlow;
- (void)loadUserPreferences;
- (void)loadVouchers;
- (void)loadFlights;
- (void)loadAirports;

- (NSArray*)getUniqueAirportList;
- (NSArray*)getFlightsFromSelectedCitiesAndDate;
- (UserData*) getUserData;

@end