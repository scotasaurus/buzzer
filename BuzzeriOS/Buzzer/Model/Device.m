//
//  Device.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "Device.h"

@implementation Device

- (id)initDevicewithId:(NSString *)deviceId andName:(NSString *)deviceName
               andInfo:(NSString *)deviceInfo
              andOwner:(NSString *)deviceOwner
             andStream:(NSString *)deviceStream {
    
    self = [super init];
    if (self) {
        _id = deviceId;
        _name = deviceName;
        _info = deviceInfo;
        _owner = deviceOwner;
        _stream = deviceStream;
        _isSignaled = false;        
    }
        
    
    return self;
}

@end
