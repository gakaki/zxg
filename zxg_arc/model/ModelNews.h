//
//  ModelNews.h
//  zxg
//
//  Created by gakaki on 12-5-30.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "Gakaki_BaseModel.h"

@interface ModelNews : Gakaki_BaseModel

@property (nonatomic, strong) NSString*  mtitle;
@property (nonatomic, strong) NSString*  mcontent;
@property (nonatomic, strong) NSString*  mcreated_at;
@property (nonatomic, strong) NSString*  mupdated_at;
@property (nonatomic, strong) NSString*  m_id;

@end
