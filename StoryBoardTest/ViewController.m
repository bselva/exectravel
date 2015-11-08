//
//  ViewController.m
//  StoryBoardTest
//
//  Created by Livani Pillay on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "ViewController.h"
#import "flow.h"

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
   
    NSLog(@"Button Tapped");
    
}

- (void)awakeFromNib{
    
    NSLog(@"The application Starts");
    Flow* flow = [Flow sharedFlow];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
