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
    [voucher1 setDestination:@"DBX"];
    
    Voucher *voucher2 = [[Voucher alloc] init];
    [voucher2 setOrigin:@"SFO"];
    [voucher2 setDestination:@"DBX"];

    Voucher *voucher3 = [[Voucher alloc] init];
    [voucher3 setOrigin:@"SFO"];
    [voucher3 setDestination:@"DBX"];

    Voucher *voucher4 = [[Voucher alloc] init];
    [voucher4 setOrigin:@"SFO"];
    [voucher4 setDestination:@"DBX"];

    Voucher *voucher5 = [[Voucher alloc] init];
    [voucher5 setOrigin:@"SFO"];
    [voucher5 setDestination:@"DBX"];

    Voucher *voucher6 = [[Voucher alloc] init];
    [voucher6 setOrigin:@"LAS"];
    [voucher6 setDestination:@"CDG"];

    Voucher *voucher7 = [[Voucher alloc] init];
    [voucher7 setOrigin:@"SFO"];
    [voucher7 setDestination:@"CDG"];

    [vouchers addObject:voucher1];
    [vouchers addObject:voucher2];
    [vouchers addObject:voucher3];
    [vouchers addObject:voucher4];
    [vouchers addObject:voucher5];
    [vouchers addObject:voucher6];
    [vouchers addObject:voucher7];

    
    return vouchers ;
}
@end