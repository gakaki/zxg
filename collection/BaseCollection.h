
#import <Foundation/Foundation.h>
#import "JSONKit.h"
#import "AFHttpZxgAPIClient.h"

@interface BaseCollection : NSObject

@property (nonatomic, copy) id  json_data;
@property (nonatomic, strong) id  collection_data;


@property (nonatomic, assign) NSUInteger  count;
@property (nonatomic, assign) NSUInteger  total;
@property (nonatomic, assign) NSUInteger  page;
@property (nonatomic, assign) NSUInteger  page_size;
@property (nonatomic, assign) NSUInteger  total_page;

@property (nonatomic, strong) NSString* status;
@property (nonatomic, strong) NSString* msg;
@property (nonatomic, strong) NSString* ts;

@property (nonatomic, strong) NSString*  error_code;
@property (nonatomic, strong) NSString*  error_message;


+(void)request:(NSString*)url
  withParams:(NSDictionary*)extra_params
withSuccBlock:(void (^)(id succ_data))succBlock 
withFailBlock:(void (^)(id fail_data))failBlock 
withDealDataBlock:(id (^)(id collection_class_instance))dealDataBlock;

-(id)initWithJSON:(id)json_object;

@end
