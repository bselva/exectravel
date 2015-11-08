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
    
    self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.overlay setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    [self.view addSubview:self.overlay];
    
    self.activityView=[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityView.center=self.view.center;
    [self.activityView startAnimating];
    [self.view addSubview:self.activityView];

    [NSTimer scheduledTimerWithTimeInterval:3.5
                                     target:self
                                   selector:@selector(hideActivityIndicator)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)hideActivityIndicator
{
    [self.activityView stopAnimating];
    self.activityView.hidden = true;
    self.overlay.hidden = true;
}



- (IBAction)buttonTapped:(UIButton *)sender{
    //[self loadData];
    
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
