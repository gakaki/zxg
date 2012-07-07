//
//  SingletoncClassh.m
//  zxg
//
//  Created by gakaki on 12-6-18.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "SingletoncClass.h" 

static SingletoncClass *sharedMyManager = nil;

@implementation SingletoncClass

@synthesize someProperty;

#pragma mark Singleton Methods
+ (id)sharedManager {
    @synchronized(self) {
        if(sharedMyManager == nil)
            sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;
}
+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedManager] retain];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
- (unsigned)retainCount {
    return UINT_MAX; //denotes an object that cannot be released
}
- (oneway void)release {
    // never release
}
- (id)autorelease {
    return self;
}
- (id)init {
    if (self = [super init]) {
        someProperty = [[NSString alloc] initWithString:@"Default Property Value"];
    }
    return self;
}
- (void)dealloc {
    // Should never be called, but just here for clarity really.
    [someProperty release];
    [super dealloc];
}

@end