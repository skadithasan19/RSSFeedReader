

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol XMLParserResultDelegate <NSObject>

-(void)XMLResultReturn:(NSArray *)contents;

@end

@interface XMLParser : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *dictionaryStack;
    NSMutableString *textInProgress;
    NSError *errorPointer;
}

@property (weak, nonatomic) id <XMLParserResultDelegate> delegate;

+ (XMLParser *)XMLParserInstance;

/**
 @param url is end point.
 */
- (void) loadNewsFromAPI:(NSString *)url;

/**
 @param obj news object. which contains all news information
 @return returning new dictionary object after adding imageURL
 */

- (NSDictionary *)addImageLink:(NSDictionary *)news;

@end
