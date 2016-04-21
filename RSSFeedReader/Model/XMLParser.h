

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

- (void) loadNewsFromAPI:(NSString *)url;

- (NSDictionary *)addImageLink:(NSDictionary *)news;

@end
