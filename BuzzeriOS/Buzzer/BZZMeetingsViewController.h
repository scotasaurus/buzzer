//
//  BZZMeetingsViewController.m
//  Buzzer
//
//  Created by rdaly on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BZZMeetingsViewController.h"
#import "MeetingRequest.h"

@interface BZZMeetingsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIViewController *buzzController;

- (void)requestCompleted;
- (void)requestFailed;



@end

