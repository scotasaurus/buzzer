//
//  Meeting.h
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meeting : NSObject

@property NSString *name;
@property NSString *creator;

- (id)initWithName:(NSString *)nameValue andCreator:(NSString *)creatorValue;


@end
