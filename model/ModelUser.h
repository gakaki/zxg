//
//  ModelUser.h
//  zxg
//
//  Created by gakaki on 12-6-6.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "Gakaki_BaseModel.h"
#import "SecureUDID.h"

@interface ModelUser : Gakaki_BaseModel

@property (nonatomic, strong) NSString  *mmobile;
@property (nonatomic, strong) NSString  *mpwd;

@property (readonly,nonatomic, strong) NSString  *mudid;
@property (nonatomic, strong) NSString  *mcreated_at;
@property (nonatomic, strong) NSString  *mupdated_at;


-(NSString*)mudid;

+ (void)get_login_status_with_block:(void (^)(bool login_result))block
           with_mobile:(NSString *)mobile 
              with_pwd:(NSString *)pwd;

//用户是否需要 申请加qq获取验证码
-(BOOL)is_user_need_request_qq;

@end

