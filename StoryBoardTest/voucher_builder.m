//
//  airports_builder.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "voucher_builder.h"
#import "dao.h"

@implementation VoucherBuilder

+ (NSArray *)vouchers{
    
    NSMutableArray *vouchers = [[NSMutableArray alloc] init];
    
    Voucher *voucher1 = [[Voucher alloc] init];
    [voucher1 setOrigin:@"SFO"];
    [voucher1 setDestination:@"DXB"];
    
    Voucher *voucher2 = [[Voucher alloc] init];
    [voucher2 setOrigin:@"SFO"];
    [voucher2 setDestination:@"DXB"];

    Voucher *voucher3 = [[Voucher alloc] init];
    [voucher3 setOrigin:@"SFO"];
    [voucher3 setDestination:@"DXB"];

    Voucher *voucher4 = [[Voucher alloc] init];
    [voucher4 setOrigin:@"SFO"];
    [voucher4 setDestination:@"DXB"];

    Voucher *voucher5 = [[Voucher alloc] init];
    [voucher5 setOrigin:@"SFO"];
    [voucher5 setDestination:@"DXB"];

    Voucher *voucher6 = [[Voucher alloc] init];
    [voucher6 setOrigin:@"SFO"];
    [voucher6 setDestination:@"CDG"];

    Voucher *voucher7 = [[Voucher alloc] init];
    [voucher7 setOrigin:@"SFO"];
    [voucher7 setDestination:@"GRU"];
    
    Voucher *voucher8 = [[Voucher alloc] init];
    [voucher8 setOrigin:@"SFO"];
    [voucher8 setDestination:@"GRU"];
    
    Voucher *voucher9 = [[Voucher alloc] init];
    [voucher9 setOrigin:@"SFO"];
    [voucher9 setDestination:@"GRU"];
   
    
    Voucher *voucher10 = [[Voucher alloc] init];
    [voucher10 setOrigin:@"SFO"];
    [voucher10 setDestination:@"LAS"];
    
    Voucher *voucher11 = [[Voucher alloc] init];
    [voucher11 setOrigin:@"SFO"];
    [voucher11 setDestination:@"LAS"];

    [vouchers addObject:voucher1];
    [vouchers addObject:voucher2];
    [vouchers addObject:voucher3];
    [vouchers addObject:voucher4];
    [vouchers addObject:voucher5];
    [vouchers addObject:voucher6];
    [vouchers addObject:voucher7];
    [vouchers addObject:voucher8];
    [vouchers addObject:voucher9];
    [vouchers addObject:voucher10];
    [vouchers addObject:voucher11];

    
    return vouchers ;
}
@end