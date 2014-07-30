//
//  MeetingRequest.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//


#import "MeetingRequest.h"
#import "Meeting.h"

@implementation MeetingRequest

- (id) init {
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@", baseUrl, meetingRequestUrl];
    
    return [super initWithUrl:urlString];
}


- (NSArray *)getMeetings {
    NSMutableArray * meetings = nil;
    
    NSDictionary * jsonData = [self getDataFromResponse];
    if (jsonData != nil)
    {
        NSArray * rawSessionData = jsonData[@"Sessions"];
        for (NSDictionary *sessionData in rawSessionData)
        {
            if (meetings == nil) {
                meetings = [[NSMutableArray alloc] init];
            }
            
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
            [meetings addObject:meeting];

        }
    }
    
    return meetings;
}

@end
