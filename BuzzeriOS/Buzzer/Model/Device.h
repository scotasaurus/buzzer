//
//  Device.h
//  Buzzer
//
//  Created by Scot McIntosh on 7/30/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property NSString * id;
@property NSString * name;
@property NSString * info;
@property NSString * owner;
@property NSString * stream;
@property bool isSignaled;

- (id)initDevicewithId:(NSString *)deviceId andName:(NSString *)deviceName
                                            andInfo:(NSString *)deviceInfo
                                            andOwner:(NSString *)deviceOwner
                                            andStream:(NSString *)deviceStream;

@end
