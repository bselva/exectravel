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

<<<<<<< HEAD
=======
- (void)hideActivityIndicator
{
    [self.activityView stopAnimating];
    self.activityView.hidden = true;
    self.overlay.hidden = true;
}

>>>>>>> 77494593bc2b2363acda22e06956682ccbb7a007
- (IBAction)buttonTapped:(UIButton *)sender{
   
    NSLog(@"Button Tapped");
    
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
