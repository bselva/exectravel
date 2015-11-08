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
