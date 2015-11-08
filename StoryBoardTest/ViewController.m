//
//  ViewController.m
//  StoryBoardTest
//
//  Created by Livani Pillay on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "ViewController.h"
#import "dao.h"
#import "airport_builder.h"
#import "flight_builder.h"
#import "voucher_builder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)buttonTapped:(UIButton *)sender{
    [self loadData];
    
}

- (void)loadData{
    
    NSError *error;
    NSArray* airports = [AirportBuilder airportsFromJSON:[AirportBuilder readJSONFile] error:error];
    
    //
    for (id airport in airports){
        NSLog(@"%@",[airport fullName]);
    }
    
    NSArray* vouchers = [VoucherBuilder vouchers];
    
    
    for (id voucher in vouchers){
        NSLog(@"%@",[voucher destination]);
    }
    
    NSArray* flights = [FlightBuilder flightsFromJSON:[FlightBuilder readJSONFile] error:error];
    
    //for (id flight in flights){
    //    NSLog(@"%@",[flight destination]);
    //}
    
//    NSMutableArray *myArray = [NSMutableArray array];
//    
//    for(int i = 0; i < 10; i++) {
//        
//        Flight *flight = [[Flight alloc] init];
//        flight.origin = @"Ben";
//        flight.destination = @"Ben";
//        flight.destination = @"Ben";
//        flight.destination = @"Ben";
//        flight.destination = @"Ben";
//        flight.destination = @"Ben";
//        [myArray addObject:flight];
//    }
//    
//    NSLog(@"myArray:\n%@", myArray);
//    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
