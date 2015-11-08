//
//  FlightViewController.h
//  ExecTravel
//
//  Created by Livani Pillay on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlightViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UIToolbar *doneBar;

@property (nonatomic,weak) IBOutlet UITextField *dateField;

@end
