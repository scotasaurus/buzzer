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
        NSArray * rawMeetingsData = jsonData[@"Meetings"];
        for (NSDictionary *meetingData in rawMeetingsData)
        {
            if (meetings == nil) {
                meetings = [[NSMutableArray alloc] init];
            }
            
            Meeting * meeting = [[Meeting alloc] initWithName:meetingData[@"name"]
                                                   andCreator:meetingData[@"creator"]];
            [meetings addObject:meeting];

        }
    }
    
    return meetings;
}

@end
