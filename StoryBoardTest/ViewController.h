//
//  ViewController.h
//  StoryBoardTest
//
//  Created by Livani Pillay on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) IBOutlet UILabel *vouchersAvailabe;
@property (nonatomic,strong) IBOutlet UILabel *headQuarters;

- (IBAction)buttonTapped:(UIButton *)sender;

@end

