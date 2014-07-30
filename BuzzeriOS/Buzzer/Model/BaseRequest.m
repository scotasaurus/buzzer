//
//  BaseRequest.m
//  Buzzer
//
//  Created by Scot McIntosh on 7/29/14.
//  Copyright (c) 2014 ___SKUNKd___. All rights reserved.
//

// This is a base class that will handle async web requests to a provided URL. For now, we'll hard code
// requests to be JSON GET requests. We can refine as neccessary.
// Note that the caller will have to implement the ServiceRequestDelegate methods in order for this to work--
// All requests are asynchronous, so the callback will notify (the UI thread) when the request has been completed.

#import "BaseRequest.h"
#import "ServiceRequestDelegate.h"

@implementation BaseRequest


- (void)setDelegate:(id)delegate {
    _delegate = delegate;
}

- (void)makeRequest:(NSString *)url {
    _dataCollected = false;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                             
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:60.0];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"Accept" forHTTPHeaderField:@"application/json"];
    [request setValue:@"Content-Type" forHTTPHeaderField:@"application/json"];

    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (NSDictionary *)getDataFromResponse {
    if (_dataCollected == false) {
        return nil;
    }
    
    NSError *error;
    NSMutableDictionary * jsonResponse = [NSJSONSerialization
                                         JSONObjectWithData:_responseData
                                         options:NSJSONReadingMutableContainers
                                         error:&error];
    
    return jsonResponse;
}
                    
#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    // nil indicates not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {

    _dataCollected = true;

    // Notify the caller that the data is available.
    [_delegate requestCompleted];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    _dataCollected = false;
    
    //Notify the caller that the request failed.
    [_delegate requestFailed];
}

@end
