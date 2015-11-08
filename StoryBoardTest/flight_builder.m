//
//  flight_builder.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "flight_builder.h"
#import "dao.h"

@implementation FlightBuilder

+ (NSData *)readJSONFile{
    
    // Read JSON data into array
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"flights" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    if (jsonData == nil) {
        // handle error ...
    }
    
    return jsonData;
}


+ (NSArray *)flightsFromJSON:(NSData *)objectNotation error:(NSError *)error{

    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        error = localError;
        return nil;
    }
    
    NSMutableArray *flights = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
    NSLog(@"Count %d", results.count);
    
    for (NSDictionary *flightDic in results) {
        Flight *flightTemp = [[Flight alloc] init];
        
        for (NSString *key in flightDic) {
            if ([flightTemp respondsToSelector:NSSelectorFromString(key)]) {
            
                //TODO change the doc to works with boolean
                [flightTemp setValue:[flightDic valueForKey:key] forKey:key];
            }
        }
        
        [flights addObject:flightTemp];
    }
    
    return flights;
}
@end