//
//  FirstViewController.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BZZWelcomeViewController.h"

@interface BZZWelcomeViewController ()

@end

@implementation BZZWelcomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //TODO: Remove
    // Random test jargon.
    _meetingRequest = [[MeetingRequest alloc] init];
    [_meetingRequest setDelegate:self];
    //[_meetingRequest makeRequest:@""];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO: Remove
// Random test jargon
- (void)requestCompleted {
    [_meetingRequest getMeetingsAsync];
}

@end
