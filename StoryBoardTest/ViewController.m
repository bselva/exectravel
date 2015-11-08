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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    NSLog(@"Button Tapped!");
    [self loadData];
}

- (void)loadData{
    
    //NSArray *airports =  [NSArray arrayWithObjects:@"Eezy",@"Tutorials"];
    
    // Read JSON data into array
    NSError *error;
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"airports" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    if (jsonData == nil) {
        // handle error ...
    }
    
    NSArray* airports = [AirportBuilder airportsFromJSON:jsonData error:error];
    //
    //    for (id airport in airports){
    //        NSLog(@"%@",airport);
    //    }
    
    
    NSMutableArray *myArray = [NSMutableArray array];
    
    for(int i = 0; i < 10; i++) {
        
        Flight *flight = [[Flight alloc] init];
        flight.origin = @"Ben";
        flight.destination = @"Ben";
        flight.destination = @"Ben";
        flight.destination = @"Ben";
        flight.destination = @"Ben";
        flight.destination = @"Ben";
        [myArray addObject:flight];
    }
    
    NSLog(@"myArray:\n%@", myArray);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
