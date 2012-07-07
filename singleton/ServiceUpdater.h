//
//  ServiceUpdater.h
//  zxg
//
//  Created by gakaki on 12-6-18.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletoncClass.h"
#import "Constrants.h"
#import "AFHttpZxgAPIClient.h"


@interface ServiceUpdater : SingletoncClass<UIAlertViewDelegate>


@property (nonatomic, strong) NSString* app_ver;
@property (nonatomic, strong) NSString* app_store_url;

-(void)checkUpdate;



@end

