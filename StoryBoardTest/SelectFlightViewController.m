//
//  SelectFlightViewController.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "SelectFlightViewController.h"

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
