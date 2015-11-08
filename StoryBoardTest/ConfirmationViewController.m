//
//  ConfirmationViewController.m
//  ExecTravel
//
//  Created by Bruno on 08/11/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "ConfirmationViewController.h"
#import "dao.h"
#import "Flow.h"

@interface ConfirmationViewController ()

@end

@implementation ConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.overlay setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    [self.view addSubview:self.overlay];
    
    self.activityView=[[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityView.center=self.view.center;
    [self.activityView startAnimating];
    [self.view addSubview:self.activityView];
    
    [self.flightNumber setText:@"-"];
    [self.from setText:@"-"];
    [self.to setText:@"-"];
    
    [self.arrivalDate setText:@"-"];
    [self.arrivalTime setText:@"-"];
    
    [self.departureDate setText:@"-"];
    [self.departureTime setText:@"-"];
    
    [self.seat setText:@"-"];
    [self.aircraft setHidden:true];

    [self.wifi setHidden:true];
    [self.power setHidden:true];
    [self.tv setHidden:true];
    
    [self.info setHidden:true];
    [self.aircraftImg setHidden:true];
    
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
    
    Flight* f = [flow getSelectedFlight];
    
    [self.flightNumber setText:f.number];
    [self.from setText:f.origin];
    [self.to setText:f.destination];
    
    [self.departureDate setText:[Flow dateFromISO8601StringDate:f.departureTime]];
    [self.departureTime setText:[Flow dateFromISO8601StringTime:f.departureTime]];
    
    [self.arrivalDate setText:[Flow dateFromISO8601StringDate:f.arrivalTime]];
    [self.arrivalTime setText:[Flow dateFromISO8601StringTime:f.arrivalTime]];
    
    [self.seat setText:f.seat];
    
    [self.wifi setHidden:false];
    [self.power setHidden:false];
    [self.tv setHidden:false];

    [self.info setHidden:false];
    [self.aircraftImg setHidden:false];
    [self.info setHidden:false];
    [self.aircraft setHidden:false];

    
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
