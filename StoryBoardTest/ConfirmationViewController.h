//
//  ConfirmationViewController.h
//  ExecTravel
//
//  Created by Bruno on 08/11/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmationViewController : UIViewController

@property(strong, nonatomic) UIActivityIndicatorView *activityView;
@property(strong, nonatomic) UIView *overlay;

- (void)hideActivityIndicator;

@end
