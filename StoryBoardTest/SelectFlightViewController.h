//
//  SelectFlightViewController.h
//  ExecTravel
//
//  Created by Wellington Soares on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectFlightViewController : UIViewController

@property(strong, nonatomic) UIActivityIndicatorView *activityView;
@property(strong, nonatomic) UIView *overlay;

- (void)hideActivityIndicator;


@end
