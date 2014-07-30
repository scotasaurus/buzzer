//
//  MeetingRequest.h
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BaseRequest.h"
#import "Meeting.h"

static NSString const * getAllMeetingsRequestUrl    = @"api/sessions/GetAllSessions";
static NSString const * getMeetingRequestUrl        = @"api/sessions/GetMeeting";
static NSString const * createMeetingRequestUrl     = @"api/sessions/CreateMeeting";
static NSString const * joinMeetingRequestUrl       = @"api/sessions/JoinMeeting";
static NSString const * signalMeetingRequestUrl     = @"api/sessions/SignalMeeting";
static NSString const * leaveMeetingRequestUrl      = @"api/sessions/LeaveMeeting";
static NSString const * removeMeetingRequestUrl     = @"api/sessions/RemoveMeeting";

<<<<<<< HEAD
static NSString const * meetingRequestUrl = @"name/name/creator/creator";
=======
>>>>>>> FETCH_HEAD

@interface MeetingRequest : BaseRequest

- (void)getMeetingsAsync;
- (void)getMeetingAsync:(NSString *)meetingId;
- (void)createMeetingAsync:(NSString *)meetingName withDevice:deviceId;
- (void)joinMeetingAsync:(NSString *)meetingId withDevice:deviceId;
- (void)signalMeetingAsync:(NSString *)meetingId withDevice:deviceId;
- (void)leaveMeetingAsync:(NSString *)meetingId withDevice:deviceId;
- (void)removeMeetingAsync:(NSString *)meetingId withDevice:deviceId;

- (NSArray *)processGetAllMeetingsResponse;
- (Meeting *)processGetMeetingResponse;

- (Meeting *)_parseSessionDataFromDictionary:(NSDictionary *)sessionData;

@end
