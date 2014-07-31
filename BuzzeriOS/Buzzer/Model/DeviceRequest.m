//
//  DeviceRequest.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import "DeviceRequest.h"

static NSString * oneParameterApi   = @"%@%@/%@";
static NSString * threeParameterApi = @"%@%@/%@/%@/%@";


@implementation DeviceRequest

- (void)registerDeviceAsync:(NSString *)deviceName withDeviceOwner:(NSString *)deviceOwner andDeviceInfo:(NSString *)deviceInfo {
    NSString *urlString = [[NSString alloc] initWithFormat:threeParameterApi, baseUrl, registerDeviceRequestUrl, deviceName, deviceOwner, deviceInfo];
    [super makeRequest:urlString];
}

- (void)getDeviceAsync:(NSString *)deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:oneParameterApi, baseUrl, getDeviceRequestUrl, deviceId];
    [super makeRequest:urlString];
}

- (void)isSignaledAsync:(NSString *)deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:oneParameterApi, baseUrl, isSignaledRequestUrl, deviceId];
    [super makeRequest:urlString];
}

- (void)removeDeviceAsync:(NSString *)deviceId {
    NSString *urlString = [[NSString alloc] initWithFormat:oneParameterApi, baseUrl, removeDeviceRequestUrl, deviceId];
    [super makeRequest:urlString];
}

- (Device *)getDevice:(NSString *)deviceId {
    Device * device = nil;
    
    NSDictionary * jsonData = [self getDataFromResponse];
    if (jsonData != nil)
    {
        device = [self _parseDeviceDataFromDictionary:jsonData];
    }
    
    return device;
}

// TODO: Make this static and allow meetings controller to use this.
- (Device *)_parseDeviceDataFromDictionary:(NSDictionary *)deviceData {
    Device * device = [[Device alloc] initDevicewithId:deviceData[@"Id"]
                                               andName:deviceData[@"Name"]
                                               andInfo:deviceData[@"DeviceInfo"]
                                              andOwner:deviceData[@"DeviceOwner"]
                                             andStream:deviceData[@"Stream"]];
    
    return device;
}

@end
