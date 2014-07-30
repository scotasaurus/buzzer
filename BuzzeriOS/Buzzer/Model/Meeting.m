//
//  Meeting.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "Meeting.h"

@implementation Meeting

- (id)initWithId:(NSString *)meetingId andName:(NSString *)meetingName andCreator:(Device *)meetingCreator andClients:(NSArray *)meetingClients {
    self = [super init];
    if (self) {
        _id = meetingId;
        _name = meetingName;
        _creator = meetingCreator;
        _clients = meetingClients;
        
    }
    
    return self;
}


@end