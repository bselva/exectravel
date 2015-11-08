//
//  ViewController.h
//  StoryBoardTest
//
//  Created by Livani Pillay on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(strong, nonatomic) UIActivityIndicatorView *activityView;
@property(strong, nonatomic) UIView *overlay;

- (IBAction)buttonTapped:(UIButton *)sender;
- (void)hideActivityIndicator;

@end

