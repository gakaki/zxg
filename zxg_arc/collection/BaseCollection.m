
#import "BaseCollection.h"

@implementation BaseCollection

@synthesize count,total,page,page_size,total_page,status,msg,ts,json_data,collection_data,error_code,error_message;


-(id)initWithJSON:(id)json_object{
    
    self = [super init];
    if(self) {
        
        json_data = json_object;        
        NSDictionary* json_dict = (NSDictionary*)json_data;
        
        collection_data = [json_dict valueForKey:@"data"];
        count = (NSUInteger)[json_dict objectForKey:@"count"];
        total = (NSUInteger)[json_dict objectForKey:@"total"];
        page  = (NSUInteger)[json_dict objectForKey:@"page"];
        page_size = (NSUInteger)[json_dict objectForKey:@"page_size"];        
        total_page = (NSUInteger)[json_dict objectForKey:@"total_page"];

        status = (NSString*)[json_dict objectForKey:@"status"];
        msg = (NSString*)[json_dict objectForKey:@"msg"];
        ts = (NSString*)[json_dict objectForKey:@"ts"];
        
        error_code = (NSString*)[json_dict objectForKey:@"error_code"];
        error_message = (NSString*)[json_dict objectForKey:@"error_message"];
        
    }
    return self;
}

+(void)request:(NSString*)url
  withParams:(NSDictionary*)extra_params
withSuccBlock:(void (^)(id succ_data))succBlock
withFailBlock:(void (^)(id fail_data))failBlock 
withDealDataBlock:(id (^)(id collection_class_instance))dealDataBlock{
    
    [[AFHttpZxgAPIClient sharedClient] getPath:url parameters:extra_params success:^(AFHTTPRequestOperation *operation, id JSON) {
        
        NSLog(@"json is %@",JSON);
        id json_obj = [[self alloc]initWithJSON:JSON];
        
        if (dealDataBlock) {
            json_obj = dealDataBlock( json_obj );
        }
        
        if (succBlock) {
            succBlock( json_obj );
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
        [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
        
        if (failBlock) {
            failBlock(error);
        }
    }];

}






@end
