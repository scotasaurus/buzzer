//
//  BZZCreateMeetingViewController.m
//  Buzzer
//
//  Created by rdaly on 8/6/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BZZCreateMeetingViewController.h"

@interface BZZCreateMeetingViewController ()

@property (weak, nonatomic) IBOutlet UITextField *startTime;
@property (weak, nonatomic) IBOutlet UITextField *endTime;

@end

@implementation BZZCreateMeetingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_startTime setDelegate:self];
    [_endTime setDelegate:self];
    // Do any additional setup after loading the view.
    
    UIDatePicker *startDatePicker = [[UIDatePicker alloc] init];
    [startDatePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    
    UIDatePicker *endDatePicker = [[UIDatePicker alloc] init];
    [endDatePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    
    _startTime.inputView = startDatePicker;
    _endTime.inputView = endDatePicker;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
