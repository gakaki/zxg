//
//  AFHttpZxgAPIClient.m
//  zxg
//
//  Created by gakaki on 12-5-31.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "AFHttpZxgAPIClient.h"
#import "AFJSONRequestOperation.h"



static NSString * const kAFZXGAPIBaseURLString = @"http://127.0.0.1:3000/";


@implementation AFHttpZxgAPIClient

+ (AFHttpZxgAPIClient *)sharedClient {
    static AFHttpZxgAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFHttpZxgAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAFZXGAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    return self;
}

@end
