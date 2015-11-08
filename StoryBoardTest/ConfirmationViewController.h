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


@property (nonatomic,strong) IBOutlet UILabel *flightNumber;
@property (nonatomic,strong) IBOutlet UILabel *from;
@property (nonatomic,strong) IBOutlet UILabel *to;


@property (nonatomic,strong) IBOutlet UILabel *departurelDate;
@property (nonatomic,strong) IBOutlet UILabel *departureTime;


@property (nonatomic,strong) IBOutlet UILabel *seat;
@property (nonatomic,strong) IBOutlet UILabel *commuting;


@property (nonatomic,strong) IBOutlet UIImageView *wifi;
@property (nonatomic,strong) IBOutlet UIImageView *power;




- (void)hideActivityIndicator;

@end
