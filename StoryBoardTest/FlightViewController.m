//
//  FlightViewController.m
//  ExecTravel
//
//  Created by Livani Pillay on 11/7/15.
//  Copyright © 2015 livani. All rights reserved.
//

#import "FlightViewController.h"
#import "Flow.h"

@interface FlightViewController ()

@end

@implementation FlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateField.delegate = self;
    self.locationField.delegate = self;
    
    self.locationSourceArray =  [[NSMutableArray alloc]init];
    
    Flow* flow = [Flow sharedFlow];
    
    NSArray* allAirportsFiltered = [flow getUniqueAirportList];
    for (Airport* airport in allAirportsFiltered){
        NSLog(@"Added %@", [airport fullName]);
        [self.locationSourceArray addObject:airport];
    }
    
//            [self.locationSourceArray addObject:@"NYC"];
//            [self.locationSourceArray addObject:@"LDN"];
//            [self.locationSourceArray addObject:@"DBX"];
//            [self.locationSourceArray addObject:@"LAX"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)sender
{
    
    if((UITextField*)sender == self.dateField)
    {
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        [datePicker setDate:[NSDate date]];
        [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
        [self.dateField setInputView:datePicker];
        
        self.doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, (datePicker.frame.size.height*2)-22, CGRectGetWidth(self.view.frame), 44)];
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
    else if((UITextField*)sender == self.locationField){
        

        
        CGRect framePickerView = CGRectMake(self.view.frame.size.height, (self.view.frame.size.height*2)-22, CGRectGetWidth(self.view.frame),60);
        UIPickerView *locationPicker =[[[UIPickerView alloc] init]initWithFrame:framePickerView];
        
        CGAffineTransform t0 = CGAffineTransformMakeTranslation (1.0, locationPicker.bounds.size.height);
        CGAffineTransform s0 = CGAffineTransformMakeScale       (1.0, 0.5);
        CGAffineTransform t1 = CGAffineTransformMakeTranslation (1, locationPicker.bounds.size.height);
        locationPicker.transform = CGAffineTransformConcat    (t0, CGAffineTransformConcat(s0, t1));
        
        locationPicker.backgroundColor =[UIColor whiteColor];
        [self.view addSubview:locationPicker];

        locationPicker.dataSource = self;
        locationPicker.delegate = self;

    }
}

#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [self.locationSourceArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    
    NSString* destination = [[self.locationSourceArray objectAtIndex:row] fullName];
    
    [self.locationField setText:destination];
    
    [self.locationPicker performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.5];
    Flow* flow = [Flow sharedFlow];
    [flow setSelectedDestination:destination];

    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [[self.locationSourceArray objectAtIndex:row] fullName];
}

- (IBAction)datePickerDone:(id)sender {
    [self.dateField resignFirstResponder];
    [self.doneBar setHidden:true];
}

-(void)updateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.dateField.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM d yyyy HH:mm a"];
    self.dateField.text =  [dateFormat stringFromDate:picker.date];
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
