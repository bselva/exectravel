//
//  airports_builder.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "airport_builder.h"
#import "dao.h"

@implementation AirportBuilder

+ (NSData *)readJSONFile{
    
    // Read JSON data into array
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"airports" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    if (jsonData == nil) {
        // handle error ...
    }
    
    return jsonData;
}

+ (NSArray *)airportsFromJSON:(NSData *)objectNotation error:(NSError *)error{
    
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        error = localError;
        return nil;
    }
    
    NSMutableArray *airports = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
    NSLog(@"Count %d", results.count);
    
    for (NSDictionary *airportDic in results) {
        Airport *airportTemp = [[Airport alloc] init];
        
        for (NSString *key in airportDic) {
            if ([airportTemp respondsToSelector:NSSelectorFromString(key)]) {
                [airportTemp setValue:[airportDic valueForKey:key] forKey:key];
            }
        }
        
        [airports addObject:airportTemp];
    }
    
    return airports;
}
@end