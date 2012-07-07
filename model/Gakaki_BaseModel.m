//
//  Gakaki_BaseModel.m
//  zxg
//
//  Created by gakaki on 12-5-30.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "Gakaki_BaseModel.h"

@implementation Gakaki_BaseModel

/**
 返回该类的结构
 */
+(NSDictionary*)getStructsList{return nil;};

/**
 根据json中的key value填充相应的属性值。
 json的name对应该类中的mname属性, 例如: json的name为address, 则对应本类的属性为maddress。
 @param json 的data 数据
 @returns 已填充了属性值的GY_BaseModel 实例化对象
 */
+(id)parseFromJSON:(id)json_data{

    NSString* str_key;
	NSString* str_value;
    
    id self_class = [[[self class]alloc]init];

    for (id key in [json_data allKeys]) {
   
        str_key     = [NSString stringWithFormat:@"setM%@:",(NSString*)key];
		str_value   = [json_data objectForKey:key];
    
        if ([self_class respondsToSelector:NSSelectorFromString(str_key)])
		{
            //NSLog(@"%@ - %@",str_key,str_value);
			[self_class performSelector:NSSelectorFromString(str_key) withObject:str_value];
		}
    }
    
	return self_class;


}



@end
