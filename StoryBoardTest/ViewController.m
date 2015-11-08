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



- (void)awakeFromNib{
    
    NSLog(@"The first view starts");
    Flow* flow = [Flow sharedFlow];
    UserData* a = [flow getUserData];
    //NSLog(@"TESTE %@", a.defaultLocation);
    self.headQuarters.text = a.defaultLocation;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
