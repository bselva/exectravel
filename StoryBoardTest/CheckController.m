//
//  CheckController.m
//  ExecTravel
//
//  Created by Wellington Soares on 11/8/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "CheckController.h"
#import "Flow.h"

@interface CheckController ()

@end

@implementation CheckController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Flow* flow = [Flow sharedFlow];
    
    Flight* f = [flow getSelectedFlight];
    
    [self.flightNumber setText:f.number];
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
