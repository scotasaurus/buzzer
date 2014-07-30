//
//  Meeting.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "Meeting.h"

@implementation Meeting

- (id)initWithName:(NSString *)nameValue andCreator:(NSString *)creatorValue {
    self = [super init];
    if (self) {
        _name = nameValue;
        _creator = creatorValue;
    }
    
    return self;
}


@end
