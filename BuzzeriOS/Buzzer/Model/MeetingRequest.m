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

// Parsing this structure:
// [{"MeetingId":"c177bb92-f01d-4056-9660-6b015c83cedd","MeetingName":"MyMeeting","ParentDevice":{"Id":"9418a0a0-5d96-4eaf-9642-aa8feda3482f","Name":"myDevice","deviceInfo":"abc123","deviceOwner":"Scot","stream":null,"signal":true},"Devices":[{"Id":"9418a0a0-5d96-4eaf-9642-aa8feda3482f","Name":"myDevice","deviceInfo":"abc123","deviceOwner":"Scot","stream":null,"signal":true}]}]

- (NSArray *)processGetAllMeetingsResponse {
    NSMutableArray * meetings = nil;
    
    NSDictionary * jsonData = [self getDataFromResponse];
    if (jsonData != nil)
    {
        NSArray * rawSessionData = (NSArray *)jsonData;
        for (NSDictionary *sessionData in rawSessionData)
        {
            if (meetings == nil) {
                meetings = [[NSMutableArray alloc] init];
            }
            Meeting * meeting = [self _parseSessionDataFromDictionary:sessionData];
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
        meeting = [self _parseSessionDataFromDictionary:jsonData];
    }
    
    return meeting;
}

- (Meeting *)_parseSessionDataFromDictionary:(NSDictionary *)sessionData {
    
    Device *creatorDevice = nil;
    
    // Device data will only be given when calling GetMeeting()
    NSDictionary *parentDeviceData = sessionData[@"ParentDevice"];
    if (![parentDeviceData isKindOfClass:[NSNull class]]) {
        creatorDevice = [[Device alloc] initDevicewithId:parentDeviceData[@"Id"]
                                                          andName:parentDeviceData[@"Name"]
                                                          andInfo:parentDeviceData[@"DeviceInfo"]
                                                         andOwner:parentDeviceData[@"DeviceOwner"]
                                                        andStream:parentDeviceData[@"Stream"]];
    }
    NSMutableArray *deviceList = nil;
    NSArray *rawClientList = sessionData[@"Devices"];
    if (![rawClientList isKindOfClass:[NSNull class]]) {
        rawClientList = [[NSMutableArray alloc] init];
        for (NSDictionary *deviceData in rawClientList) {
            Device * device = [[Device alloc] initDevicewithId:deviceData[@"Id"]
                                                       andName:deviceData[@"Name"]
                                                       andInfo:deviceData[@"DeviceInfo"]
                                                      andOwner:deviceData[@"DeviceOwner"]
                                                     andStream:deviceData[@"Stream"]];
            [deviceList addObject:device];
        }
    }
    
    Meeting * meeting = [[Meeting alloc] initWithId:sessionData[@"MeetingId"]
                                            andName:sessionData[@"MeetingName"]
                                         andCreator:creatorDevice
                                         andClients:deviceList];
    
    return meeting;
}

@end