//
//  DeviceUtilities.m
//  Buzzer
//
//  Created by rdaly on 7/31/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "DeviceUtilities.h"

@implementation DeviceUtilities

+ (NSString *)applicationUUID
{
    NSString * applicationUUID = nil;
    
    NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
    
    if ( uuid )
    {
        applicationUUID = [uuid UUIDString];
    }
    
    return applicationUUID;
}



@end
