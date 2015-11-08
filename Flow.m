//
//  Flow.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "Flow.h"
#import "airport_builder.h"
#import "flight_builder.h"
#import "voucher_builder.h"
#import "dao.h"

@implementation Flow

@synthesize  allFlights, allAirports, allVouchers, userData;


+ (id)sharedFlow {
    static Flow *sharedFlow = nil;
    @synchronized(self) {
        if (sharedFlow == nil)
            sharedFlow = [[self alloc] init];
    }
    return sharedFlow;
}

- (id)init {
    
//    if (self = [super init]) {
//        someProperty = [[NSString alloc] initWithString:@"Default Property Value"];
//    }
//
    [self loadUserPreferences];
    [self loadVouchers];
    [self loadFlights];
    [self loadAirports];
    
    return self;
}

- (void)loadUserPreferences{
    UserData *tempUserData = [[UserData alloc] init];
    [tempUserData setName:@"Elyzabeth Tayl"];
    [tempUserData setPreferedSeat:@"window"];
    [tempUserData setDefaultLocation:@"FLN"];
    [self setUserData:tempUserData];
}

- (void)loadVouchers{
    

    NSArray* vouchers = [VoucherBuilder vouchers];
    
    for (id voucher in vouchers){
        NSLog(@"%@",[voucher destination]);
    }
    
    [self setAllVouchers:vouchers];
    
}

- (void)loadFlights{
    
    NSError *error;

    NSArray* flights = [FlightBuilder flightsFromJSON:[FlightBuilder readJSONFile] error:error];
    
    for (id flight in flights){
        NSLog(@"%@",[flight destination]);
    }
    
    
    [self setAllFlights:flights];
}

- (void)loadAirports{
    
    NSError *error;
    NSArray* airports = [AirportBuilder airportsFromJSON:[AirportBuilder readJSONFile] error:error];
    
    for (id airport in airports){
        NSLog(@"%@",[airport fullName]);
    }
    
    [self setAllAirports:airports];
    
}

- (NSArray*)getUniqueAirportList{
    
    return self.allAirports;
    
}

- (NSArray*)getFlightsFrom:(NSString *)cityOne withDestination:(NSString *)cityTwo{
    
    return self.allFlights;
    
}


-(UserData*)getUserData{
    
    return self.userData;
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end