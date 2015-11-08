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

@implementation Flow

@synthesize  allFlights, allAirports, allVouchers, userData;



+ (NSString *) dateFromISO8601StringDate:(NSString *)dateString{
    
    if (!dateString) return @"-";
    
    if ([dateString hasSuffix:@"Z"]) {
        dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"-0000"];
    }
    
    dateString = [dateString stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HHmmssZ";
    NSDate* date = [dateFormatter dateFromString:dateString];
    
    
    NSDateFormatter *formatter2;
    formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"YY-MM-dd"];
    
    return [formatter2 stringFromDate:date];
}

+ (NSString *) dateFromISO8601StringTime:(NSString *)dateString{
    
    if (!dateString) return @"-";
    
    if ([dateString hasSuffix:@"Z"]) {
        dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"-0000"];
    }
    
    dateString = [dateString stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HHmmssZ";
    NSDate* date = [dateFormatter dateFromString:dateString];
    
    
    NSDateFormatter *formatter2;
    formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"HH:mm"];
    
    return [formatter2 stringFromDate:date];
    
}


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
    [tempUserData setDefaultLocation:@"SFO"];
    [self setUserData:tempUserData];
}

- (void)loadVouchers{
    
    
    NSArray* vouchers = [VoucherBuilder vouchers];
    
    //    for (id voucher in vouchers){
    //        NSLog(@"%@",[voucher destination]);
    //    }
    
    [self setAllVouchers:vouchers];
    
}

- (void)loadFlights{
    
    NSError *error;
    
    NSArray* flights = [FlightBuilder flightsFromJSON:[FlightBuilder readJSONFile] error:error];
    
    //    for (id flight in flights){
    //        NSLog(@"%@",[flight destination]);
    //    }
    
    
    [self setAllFlights:flights];
}


-(Flight*) getSelectedFlight{
    return [self selectedFlight];
}

- (void)loadAirports{
    
    NSError *error;
    NSArray* airports = [AirportBuilder airportsFromJSON:[AirportBuilder readJSONFile] error:error];
    
    NSMutableDictionary* indexedAirports =  [[NSMutableDictionary alloc] init];
    
    for (Airport* airport in airports){
        
        [indexedAirports setObject:airport forKey:[airport iata]];
        
    }
    
    [self setIndexedAirports:indexedAirports];
    [self setAllAirports:airports];
    
    //for (NSString* key in indexedAirports){
    //     NSLog(@"key %@ - %@",key, [[indexedAirports valueForKey:key] fullName]);
    //}
    
}

//return all airports filtered by my Location AndVouchersBought
- (NSArray*)getUniqueAirportList{
    
    NSString* userLocation = self.userData.defaultLocation;
    NSMutableArray *response = [[NSMutableArray alloc] init];
    
    for (Voucher* voucher in [self allVouchers]){
        
        NSString* origin = [voucher origin];
        NSString* destination = [voucher destination];
        
        if([origin isEqualToString:userLocation]){
            
            Airport* a = [[self indexedAirports] valueForKey:destination];
            if(a != NULL){
                
                [response addObject:a];
            }
            
        }else{
            
            NSLog(@"skipping because the origin is different from userLocation- %@", [voucher destination]);
            
        }
        
    }
    
    return [response valueForKeyPath:@"@distinctUnionOfObjects.self"];
    
}

- (NSArray*)getFlightsFromSelectedCitiesAndDate{
    
    NSString* userLocation = self.userData.defaultLocation;
    NSMutableArray *response = [[NSMutableArray alloc] init];
    
    for (Flight* flight in [self allFlights]){
        NSString* origin = [flight origin];
        NSString* destination = [flight destination];
              
        if([origin isEqualToString:userLocation] && [destination isEqualToString:self.selectedDestination]){
            
            //TODO check the date
            NSLog(@"ADDICIONADO %@", flight.number);
            
            [response addObject:flight];
            
        }else{
            
            NSLog(@"%@, %@, %@, %@ nao add, eh diferente", origin, destination, userLocation, self.selectedDestination);

        }
        
    }
    
   return response;

}


-(UserData*)getUserData{
    
    return self.userData;
    
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end