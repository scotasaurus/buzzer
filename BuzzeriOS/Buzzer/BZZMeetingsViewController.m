//
//  BZZMeetingsViewController.m
//  Buzzer
//
//  Created by Scot McIntosh and Rob Daly on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BZZMeetingsViewController.h"
#import "DeviceUtilities.h"
#import "DeviceRequest.h"

@interface BZZMeetingsViewController ()

#pragma mark - Properties

@property (nonatomic, retain) NSString *appUUID;
@property (nonatomic, retain) MeetingRequest *meetingRequest;
@property (nonatomic, retain) DeviceRequest *deviceRequest;
@property (nonatomic, retain) NSArray * meetings;
@property (nonatomic, retain) UIView * progressView;

- (IBAction)addMeeting:(id)sender;

@end

@implementation BZZMeetingsViewController

#pragma mark - Initialization and View loading

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _meetings = nil;
        _meetingRequest = [[MeetingRequest alloc] init];
        [_meetingRequest setDelegate:self];
        [_meetingRequest getMeetingsAsync];
        
        _deviceRequest = [[DeviceRequest alloc] init];
        [_deviceRequest setDelegate:self];
       
        
        [_deviceRequest registerDeviceAsync:@"Rob's iPhone 5s" withDeviceOwner:@"Rob Daly" andDeviceInfo:[DeviceUtilities applicationUUID]];
        
        _appUUID = [DeviceUtilities applicationUUID];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    [self.navigationController.toolbar setBarStyle:UIBarStyleBlackOpaque];
    [self createProgressIndication];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_meetings == nil) {
        return 0;
    }
    
    // Return the number of rows in the section.
    return [_meetings count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MeetingCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[_meetings objectAtIndex:indexPath.row] name];
    
    if(indexPath.row >= ([_meetings count] -1) ) {
        [self hideProgressIndication];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell: (UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *) indexPath {
    
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


#pragma mark - ServiceRequestDelegate Methods

- (void)requestCompleted {
    _meetings = [_meetingRequest processGetAllMeetingsResponse];
    [[self tableView] reloadData];
}

- (void)requestFailed {
    // TODO: Do something here.
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Navigation (This is where we implement meeting bindings)
 /*
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
*/


#pragma mark - IBActions

- (IBAction)addMeeting:(id)sender {
    
    CGSize size = CGSizeMake(50.0f,50.0f);
    [self presentModalViewControllerWithIdentifier:@"newMeeting" andSize:size andModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//
//    [self createMeeting:@"test"];
    
//    if ([self createMeeting:@"Test"] )
//    {
//        
//    }
    
    //Dismiss the presentation view controlller at this point
}

#pragma - mark Utilities

- (BOOL)createMeeting:(NSString *)meetingID
{
    if ( meetingID )
    {
        [_meetingRequest createMeetingAsync:@"GazaCeaseFireInformal" withDevice:@"7812180c-dbe5-4cc5-9021-bcfe71a00b61"];
    }
    return NO; 
}

- (void)createMeetingWithID:(NSString *)meetingID forStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate
{
    
}


- (UIViewController *)presentModalViewControllerWithIdentifier:(NSString *)identifier
                                                        andSize:(CGSize)size
                                        andModalTransitionStyle:(UIModalTransitionStyle)modalTransitionStyle {
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    
    viewController.modalPresentationStyle = UIModalPresentationPageSheet;
    viewController.modalTransitionStyle = modalTransitionStyle;
    [self presentViewController:viewController animated:YES completion:nil];
    viewController.view.superview.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    viewController.view.superview.frame = CGRectMake(0, 0, size.width, size.height);
    CGPoint center = CGPointMake(CGRectGetMidX(screenBounds), CGRectGetMidY(screenBounds));
    viewController.view.superview.center = UIDeviceOrientationIsPortrait(self.interfaceOrientation) ? center : CGPointMake(center.y, center.x);
    
    return viewController;
}


#pragma mark - Progress Indication

- (void)createProgressIndication
{
    // Activity indicator
    _progressView = [self progressView];
    [self.view addSubview:_progressView];
    
    // Refresh control
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    
    UIFont *font = [UIFont systemFontOfSize:16.0f];
    UIColor * white = [UIColor whiteColor];
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  /*NSParagraphStyleAttributeName: paragraphStyle,*/
                                  NSForegroundColorAttributeName: white};
    
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh" attributes:attributes];
    refresh.tintColor = [UIColor whiteColor];
    [refresh addTarget:self.tableView
                action:@selector(reloadData)
      forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
}

- (void)hideProgressIndication
{
    if ( ![_progressView isHidden] )
    {
        [UIView animateWithDuration:0.5 animations:^{
            _progressView.layer.opacity = 0.0f;
        }];
    }
    
    if ( [self.refreshControl isRefreshing] )
    {
        [self.refreshControl endRefreshing];
    }
}


- (UIView *)progressView
{
    // NOTE: progressView needs to be removed from cell in cellForRowAtIndexPath:
    CGRect progressViewFrame = CGRectZero;
    progressViewFrame.size.width = CGRectGetMaxX(self.view.bounds);
    progressViewFrame.size.height = CGRectGetMaxY(self.view.bounds) - 2;
    
    UIView *progressView = [[UIView alloc] initWithFrame:progressViewFrame];
    progressView.backgroundColor = [UIColor blackColor];
    
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:progressView.bounds];
    loadingLabel.backgroundColor = [UIColor clearColor];
    loadingLabel.font = [UIFont systemFontOfSize:18];
    loadingLabel.textColor = [UIColor whiteColor];
    loadingLabel.textAlignment = NSTextAlignmentCenter;
    loadingLabel.text = @"Loading available meetings...";
    
    // activityIndicatorView has size in which width and height is equal to 20.
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activityIndicatorView setCenter:CGPointMake(CGRectGetMidX(self.view.bounds), (CGRectGetMidY(self.view.bounds)) - 40.0f)];
    [activityIndicatorView startAnimating];
    
    [progressView addSubview:activityIndicatorView];
    [progressView addSubview:loadingLabel];
    
    return progressView;
}

@end
