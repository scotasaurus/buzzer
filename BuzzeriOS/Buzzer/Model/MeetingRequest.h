//
//  MeetingRequest.h
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BaseRequest.h"

static NSString const * meetingRequestUrl = @"name/name/creator/creator";

@interface MeetingRequest : BaseRequest

- (id) init;
- (NSDictionary *)getMeetings;

@end
