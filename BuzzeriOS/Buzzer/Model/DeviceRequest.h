//
//  DeviceRequest.h
//  Buzzer
//
//  Created by Scot McIntosh on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "BaseRequest.h"
#import "Device.h"

static NSString const * registerDeviceRequestUrl    = @"api/devices/RegisterDevice";
static NSString const * getDeviceRequestUrl         = @"api/devices/GetDevice";
static NSString const * isSignaledRequestUrl        = @"api/devices/IsSignaled";
static NSString const * removeDeviceRequestUrl      = @"api/devices/RemoveDevice";


@interface DeviceRequest : BaseRequest

- (void)registerDeviceAsync:(NSString *)deviceName withDeviceOwner:(NSString *)deviceOwner andDeviceInfo:(NSString *)deviceInfo;
- (void)getDeviceAsync:(NSString *)deviceId;
- (void)isSignaledAsync:(NSString *)deviceId;
- (void)removeDeviceAsync:(NSString *)deviceId;

- (Device *)getDevice:(NSString *)deviceId;

- (Device *)_parseDeviceDataFromDictionary:(NSDictionary *)deviceData;

@end
