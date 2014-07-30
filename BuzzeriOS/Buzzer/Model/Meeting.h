//
//  Meeting.h
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device.h"


@interface Meeting : NSObject

@property NSString *id;
@property NSString *name;
@property Device *creator;
@property NSArray *clients;

- (id)initWithId:(NSString *)meetingId andName:(NSString *)meetingName andCreator:(Device *)meetingCreator andClients:(NSArray *)meetingClients;


@end