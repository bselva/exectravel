//
//  dao.h
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#ifndef dao_h
#define dao_h

@interface Flight:NSObject
@property NSString * origin;
@property NSString * destination;
@property NSString * departureTime;
@property NSString * arrivalTime;
@property NSString * aircraft;
@property NSString * duration;
@property NSString * seat;
@property NSString * className;
@end

@interface Airport:NSObject
@property NSString * lat;
@property NSString * lon;
@property NSString * name;
@property NSString * continent;
@property NSString * iata;
-(NSString *) fullName;
@end

@interface Voucher:NSObject
@property NSString * iataOrigin;
@property NSString * iataDestination;
@end
    
#endif /* dao_h */
