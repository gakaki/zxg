//
//  Gakaki_BaseModel.h
//  zxg
//
//  Created by gakaki on 12-5-30.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHttpZxgAPIClient.h"

@interface Gakaki_BaseModel : NSObject

/**
 返回该类的结构
 */
+(NSDictionary*)getStructsList;

/**
 根据json中的key value填充相应的属性值。
 json的name对应该类中的mname属性, 例如: json的name为address, 则对应本类的属性为maddress。
 @param json 的data 数据
 @returns 已填充了属性值的GY_BaseModel 实例化对象
 */
+(id)parseFromJSON:(id)json_data;//一般说来是nsdict类型



@end
