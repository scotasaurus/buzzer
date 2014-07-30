//
//  MeetingRequest.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//


#import "MeetingRequest.h"

static NSString * noParameterApi = @"%@%@";
static NSString * oneParameterApi = @"%@%@/%@";
static NSString * twoParameterApi = @"%@%@/%@/%@";


@implementation MeetingRequest
    
- (void)getMeetingsAsync {
    NSString *urlString = [[NSString alloc] initWithFormat:noParameterApi, baseUrl, getAllMeetingsRequestUrl];
    [super makeRequest:urlString];
}

- (void)getMeetingAsync:(NSString *)meetingId {
    NSString *urlString = [[NSString alloc] initWithFormat:oneParameterApi, baseUrl, getMeetingRequestUrl, meetingId];
    [super makeRequest:urlString];
}

- (void)createMeetingAsync:(NSString *)meetingName withDevice:deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:twoParameterApi, baseUrl, createMeetingRequestUrl, meetingName, deviceId];
    [super makeRequest:urlString];
}

- (void)joinMeetingAsync:(NSString *)meetingId withDevice:deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:twoParameterApi, baseUrl, joinMeetingRequestUrl, meetingId, deviceId];
    [super makeRequest:urlString];
}

- (void)signalMeetingAsync:(NSString *)meetingId withDevice:deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:twoParameterApi, baseUrl, signalMeetingRequestUrl, meetingId, deviceId];
    [super makeRequest:urlString];
}

- (void)leaveMeetingAsync:(NSString *)meetingId withDevice:deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:twoParameterApi, baseUrl, leaveMeetingRequestUrl, meetingId, deviceId];
    [super makeRequest:urlString];
}

- (void)removeMeetingAsync:(NSString *)meetingId withDevice:deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:twoParameterApi, baseUrl, removeMeetingRequestUrl, meetingId, deviceId];
    [super makeRequest:urlString];
}

<<<<<<< HEAD
- (NSArray *)getMeetings {
    
=======
- (NSArray *)processGetAllMeetingsResponse {
>>>>>>> FETCH_HEAD
    NSMutableArray * meetings = nil;
    
    NSDictionary * jsonData = [self getDataFromResponse];
    if (jsonData != nil)
    {
        NSArray * rawMeetingsData = jsonData[@"Meetings"];
        for (NSDictionary *meetingData in rawMeetingsData)
        {
            if (meetings == nil) {
                meetings = [[NSMutableArray alloc] init];
            }
<<<<<<< HEAD
            
            Meeting * meeting = [[Meeting alloc] initWithName:meetingData[@"name"]
                                                   andCreator:meetingData[@"creator"]];
=======
            Meeting * meeting = [self _parseSessionDataFromDictionary:sessionData];
>>>>>>> FETCH_HEAD
            [meetings addObject:meeting];
        }
    }
    
    return meetings;
}

- (Meeting *)processGetMeetingResponse {
    Meeting * meeting = nil;
    
    NSDictionary * jsonData = [self getDataFromResponse];
    if (jsonData != nil)
    {
        NSDictionary * sessionData = jsonData[@"Session"];
        meeting = [self _parseSessionDataFromDictionary:sessionData];
    }
    
    return meeting;
}

- (Meeting *)_parseSessionDataFromDictionary:(NSDictionary *)sessionData {
    NSDictionary *parentDeviceData = sessionData[@"parentDevice"];
    Device * creatorDevice = [[Device alloc] initDevicewithId:parentDeviceData[@"id"]
                                                      andName:parentDeviceData[@"name"]
                                                      andInfo:parentDeviceData[@"deviceInfo"]
                                                     andOwner:parentDeviceData[@"deviceOwner"]
                                                    andStream:parentDeviceData[@"stream"]];
    
    NSMutableArray *deviceList = [[NSMutableArray alloc] init];
    NSArray *rawClientList = sessionData[@"devices"];
    for (NSDictionary *deviceData in rawClientList) {
        Device * device = [[Device alloc] initDevicewithId:deviceData[@"id"]
                                                   andName:deviceData[@"name"]
                                                   andInfo:deviceData[@"deviceInfo"]
                                                  andOwner:deviceData[@"deviceOwner"]
                                                 andStream:deviceData[@"stream"]];
        [deviceList addObject:device];
    }
    
    NSDictionary *meetingData = sessionData[@"meeting"];
    Meeting * meeting = [[Meeting alloc] initWithId:meetingData[@"id"]
                                            andName:meetingData[@"name"]
                                         andCreator:creatorDevice
                                         andClients:deviceList];
    
    return meeting;
}

@end
