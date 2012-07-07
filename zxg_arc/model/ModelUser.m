//
//  ModelUser.m
//  zxg
//
//  Created by gakaki on 12-6-6.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "ModelUser.h"
#import "AFHttpZxgAPIClient.h"
#import "SecureUDID.h"

@implementation ModelUser


@synthesize mpwd;
@synthesize mmobile;

@synthesize mcreated_at;
@synthesize mupdated_at;
@synthesize mudid;

-(NSString*)mudid{

    NSString *udid = [SecureUDID UDIDForDomain:@"com.gakaki.com" usingKey:@"superSecretCodeHere!@##%#$#%$^"];
    return udid;
}
+ (void)get_login_status_with_block:(void (^)(bool login_result))block
           with_mobile:(NSString *)mobile 
              with_pwd:(NSString *)pwd
{
    
    NSDictionary *params_dict = [NSDictionary dictionaryWithObjects:@[mobile,pwd] 
                                                    forKeys:@[@"mobile",@"pwd"]];   
                           
                                 
    [[AFHttpZxgAPIClient sharedClient]postPath:@"user/verify" parameters:params_dict success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        BOOL is_verify_succ = YES;
        NSString* status = [JSON valueForKeyPath:@"status"];
        if ([status isEqualToString:@"success"]) {
            NSLog(@"json is %@",[JSON valueForKeyPath:@"data"]);
        }else{
            NSLog(@"error is %@",[JSON valueForKeyPath:@"error"]);
            NSLog(@"error_code is %@",[JSON valueForKeyPath:@"error_code"]);
            is_verify_succ = NO;
        }
        
        if (block) {
            block(is_verify_succ);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
        
        if (block) {
            block(nil);
        }
    }];


}

-(BOOL)is_user_need_request_qq{
    return YES;
}

@end
