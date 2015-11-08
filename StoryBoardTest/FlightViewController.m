//
//  FlightViewController.m
//  ExecTravel
//
//  Created by Livani Pillay on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "FlightViewController.h"

@interface FlightViewController ()

@end

@implementation FlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateField.delegate = self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)sender
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.dateField setInputView:datePicker];
    
    self.doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, datePicker.frame.origin.y - 44, CGRectGetWidth(self.view.frame), 44)];
    [self.doneBar setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                               target:nil
                               action:nil];
    [self.doneBar setItems: [NSArray arrayWithObjects:spacer, [[UIBarButtonItem alloc]
                                                               initWithTitle:@"Done"
                                                               style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(datePickerDone:)],nil ] animated:YES];
    [self.doneBar setHidden:false];
    
    [self.view addSubview:self.doneBar];
}

- (IBAction)datePickerDone:(id)sender {
    [self.dateField resignFirstResponder];
    [self.doneBar setHidden:true];
}

-(void)updateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.dateField.inputView;
    
    self.dateField.text = [NSString stringWithFormat:@"%@",picker.date];
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
