//
//  BaseRequest.h
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString const * baseUrl = @"http://echo.jsontest.com/";

@interface BaseRequest : NSObject<NSURLConnectionDelegate>

@property NSString *url;
@property(nonatomic) id delegate;
@property NSMutableData *responseData;
@property BOOL dataCollected;

- (id)initWithUrl : (NSString *)serviceUrl;
- (void)setDelegate:(id)delegate;
- (void)makeRequest;
- (NSDictionary *)getDataFromResponse;

@end
