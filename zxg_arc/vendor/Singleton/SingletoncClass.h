//
//  SingletoncClassh.h
//  zxg
//
//  Created by gakaki on 12-6-18.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletoncClass : NSObject
{
      NSString *someProperty;
}

@property (nonatomic, retain) NSString *someProperty;

+(id)sharedManager;

@end
