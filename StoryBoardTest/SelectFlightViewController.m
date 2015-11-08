//
//  SelectFlightViewController.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "SelectFlightViewController.h"
#import "Flow.h"

@interface SelectFlightViewController ()

@end

@implementation SelectFlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.overlay setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    [self.view addSubview:self.overlay];
    
    self.activityView=[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityView.center=self.view.center;
    [self.activityView startAnimating];
    [self.view addSubview:self.activityView];
    
    
    [self.flightNumber1 setText:@"-"];
    [self.departureDate1 setText:@"-"];
    [self.departureTime1 setText:@"-"];
    [self.arrivalDate1 setText:@"-"];
    [self.arrivalTime1 setText:@"-"];
    [self.seatAvailable1 setText:@"-"];
    [self.flightNumber2 setText:@"-"];
    [self.departureDate2 setText:@"-"];
    [self.departureTime2 setText:@"-"];
    [self.arrivalDate2 setText:@"-"];
    [self.arrivalTime2 setText:@"-"];
    [self.seatAvailable2 setText:@"-"];
    [self.flightNumber3 setText:@"-"];
    [self.departureDate3 setText:@"-"];
    [self.departureTime3 setText:@"-"];
    [self.arrivalDate3 setText:@"-"];
    [self.arrivalTime3 setText:@"-"];
    [self.seatAvailable3 setText:@"-"];
    
    
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
    
    
    
    Flow* flow = [Flow sharedFlow];
    
    NSArray* flights = [flow getFlightsFromSelectedCitiesAndDate];
    
    //    while([allFlightsFiltered count] > 0){
    
    int itensProcessed = 0;

    for (Flight* flight in flights){
        
        if(itensProcessed == 3)
            return;
        
        NSLog(@"flight %@", [flight number]);
        
        
        if(itensProcessed == 0){
            [self.flightNumber1 setText:flight.number];
            [self.departureDate1 setText:[Flow dateFromISO8601StringDate:flight.departureTime]];
            [self.departureTime1 setText:[Flow dateFromISO8601StringTime:flight.departureTime]];
            [self.arrivalDate1 setText:[Flow dateFromISO8601StringDate:flight.arrivalTime]];
            [self.arrivalTime1 setText:[Flow dateFromISO8601StringTime:flight.arrivalTime]];
            [self.seatAvailable1 setText:@"No"];
        }else if(itensProcessed==1){
            [self.flightNumber2 setText:flight.number];
            [self.departureDate2 setText:[Flow dateFromISO8601StringDate:flight.departureTime]];
            [self.departureTime2 setText:[Flow dateFromISO8601StringTime:flight.departureTime]];
            [self.arrivalDate2 setText:[Flow dateFromISO8601StringDate:flight.arrivalTime]];
            [self.arrivalTime2 setText:[Flow dateFromISO8601StringTime:flight.arrivalTime]];
            [self.seatAvailable2 setText:@"Yes"];
        }else if(itensProcessed==2){
            [self.flightNumber3 setText:flight.number];
            [self.departureDate3 setText:[Flow dateFromISO8601StringDate:flight.departureTime]];
            [self.departureTime3 setText:[Flow dateFromISO8601StringTime:flight.departureTime]];
            [self.arrivalDate3 setText:[Flow dateFromISO8601StringDate:flight.arrivalTime]];
            [self.arrivalTime3 setText:[Flow dateFromISO8601StringTime:flight.arrivalTime]];
            [self.seatAvailable3 setText:@"Yes"];
        }
        
        itensProcessed++;
        
        NSLog(@"flight %@", [flight number]);
        
    }
    
}

-(void)selectFlight:(int)index{

    Flow* flow = [Flow sharedFlow];
    
    NSArray * temp = [flow getFlightsFromSelectedCitiesAndDate];
    
    if([temp count] > index){
        
        Flight* selectedFlight = [temp objectAtIndex:index];
        [flow setSelectedFlight:selectedFlight];
        
        
    }
    
}
- (IBAction)buttonTapped1:(UIButton *)sender{
    
    [self selectFlight:0];
    
}

- (IBAction)buttonTapped2:(UIButton *)sender{
    
    
    [self selectFlight:1];
}

- (IBAction)buttonTapped3:(UIButton *)sender{
    
    
    [self selectFlight:2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
