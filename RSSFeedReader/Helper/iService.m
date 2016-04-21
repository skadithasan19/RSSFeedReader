

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "iService.h"


@implementation iService


/**
 @param Success is the callback after having response.
 @param failure is the callback for fail
 */

 + (void)getJsonResponse : (NSString *)urlStr success : (void (^)(NSData *responseDict))success failure:(void(^)(NSError* error))failure
{
    
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url = [NSURL URLWithString: urlStr];
    
    
    // Asynchronously Access the url
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                       {
    dispatch_async(dispatch_get_main_queue(), ^{
                                        if(data)
                                           success(data);
                                        else {
                                            NSLog(@"Couldn't reach to the Server. Please Try again Later.");
                                        }
        });
    }];
    
    [dataTask resume] ; // Executed First
    
}


@end
