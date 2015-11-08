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
@property NSString * seat;
@property NSString * className;
@property NSString * number;
@property NSString * aircraft;
@property NSString * wifi;
@property NSString * inSeatUSB;
@property NSString * onDemandVideo;
@property NSString * streamToYourDevice;
@property NSString * inSeatPower;
@property NSString * priceInUS;
@property NSString * duration;
@property NSString * howManyStops;

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
@property NSString * origin;
@property NSString * destination;
@end

@interface UserData:NSObject
@property NSString * preferedSeat;
@property NSString * name;
@property NSString * defaultLocation;
@end

#endif /* dao_h */
