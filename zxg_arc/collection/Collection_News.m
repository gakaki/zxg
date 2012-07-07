//
//  Collection_News.m
//  zxg
//
//  Created by gakaki on 12-6-16.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "Collection_News.h"

@implementation Collection_News


+(void)requestWithSuccBlock:(void (^)(id succ_data))succBlock
 withFailBlock:(void (^)(id fail_data))failBlock{
    
    NSString* append_url = @"news/list";
    NSDictionary* extra_dict = @{@"act": @"gakaki"};
    
    [self request:append_url
       withParams:extra_dict 
    withSuccBlock:succBlock 
    withFailBlock:failBlock 
    withDealDataBlock:^(id collection_class_instance) {
        Collection_News* coll_news = (Collection_News*)collection_class_instance;
       NSLog(@"there is collection data %@",coll_news.collection_data);
        
        NSMutableArray *mutableNews = [NSMutableArray arrayWithCapacity:[coll_news count]];
        
        for (NSDictionary *item in coll_news.collection_data) {
            ModelNews *news = [ModelNews parseFromJSON:item];
            NSLog(@"model news is %@",news.mtitle);
            [mutableNews addObject:news];
        }
        
        return mutableNews;
    }];

}





@end
