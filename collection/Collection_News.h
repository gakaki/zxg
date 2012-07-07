//
//  Collection_News.h
//  zxg
//
//  Created by gakaki on 12-6-16.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "BaseCollection.h"
#import "Models.h"

@interface Collection_News : BaseCollection


+(void)requestWithSuccBlock:(void (^)(id succ_data))succBlock
              withFailBlock:(void (^)(id fail_data))failBlock;

@end
