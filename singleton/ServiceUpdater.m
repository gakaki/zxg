//
//  ServiceUpdater.m
//  zxg
//
//  Created by gakaki on 12-6-18.
//  Copyright (c) 2012年 Gakaki. All rights reserved.
//

#import "ServiceUpdater.h"
#import "AFHttpZxgAPIClient.h"

@implementation ServiceUpdater


-(void)checkUpdate{
 
    
    NSString* append_url = @"update";
    NSDictionary* extra_dict = @{@"client_version": CURRENT_VERSION};
    
    [[AFHttpZxgAPIClient sharedClient]
     getPath:append_url
     parameters:extra_dict
     success:^(AFHTTPRequestOperation *operation, id JSON) {
         
         NSLog(@"JSON is  %@",JSON);

         NSUInteger force_update = (NSUInteger)[JSON objectForKey:@"force_update"];
         NSString* msg = [JSON objectForKey:@"msg"];
         NSString* needupdate = [JSON objectForKey:@"needupdate"];
         NSString* status = (NSString*)[JSON objectForKey:@"status"];
         NSString* url = [JSON objectForKey:@"url"];
  
         [[ServiceUpdater sharedManager] setApp_store_url:url];
         [[ServiceUpdater sharedManager] setApp_ver:[JSON objectForKey:@"version"]];
        
         if (url && [url length])
         {
             if (force_update ==  1)
             {
                 UIAlertView* _alertView = [[UIAlertView alloc] initWithTitle:DEFAULT_ALTER_TITLE
                                                                      message:msg 
                                                                     delegate:self
                                                            cancelButtonTitle:@"升级"
                                                            otherButtonTitles:nil];
                 [_alertView show];
       
             }else{
                 UIAlertView* _alertView = [[UIAlertView alloc] initWithTitle:DEFAULT_ALTER_TITLE
                                                                      message:msg 
                                                                     delegate:self
                                                            cancelButtonTitle:@"升级"
                                                            otherButtonTitles:@"取消",nil];
                 [_alertView show];
        
             }
         }
         

        
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
    }];
        
}
#pragma -
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.app_store_url]];
    }
}


@end
