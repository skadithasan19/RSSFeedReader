

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "XMLParser.h"

@interface XMLParser()
@property (nonatomic,strong) NSString *element;

// @param extract item object from xml/
@property (nonatomic,strong) NSDictionary *item;

@property (nonatomic,strong) NSMutableString *title;
@property (nonatomic,strong) NSMutableString *imageURL;
@property (nonatomic,strong) NSMutableString *descriptionString;

// @param keep all feeds from xml/
@property (nonatomic,strong) NSMutableArray *feeds;


@end


@implementation XMLParser

#pragma mark -
#pragma mark Public methods

+ (XMLParser *)XMLParserInstance {
    return [[XMLParser alloc] init];
}


-(void) loadNewsFromAPI:(NSString *)url {
    
    [iService getJsonResponse:url success:^(NSData *data) {
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        parser.delegate = self;
        [parser parse];

    } failure:^(NSError *error) {
        NSLog(@"Failed to load data");
    }];
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;

    if ([elementName isEqualToString:@"item"]) {
        _item    = [[NSMutableDictionary alloc] init];
    }
    else if ([elementName isEqualToString:@"title"])
    {
        self.title = [[NSMutableString alloc] init];
    }
    else if ([elementName isEqualToString:@"description"])
    {
        self.descriptionString = [[NSMutableString alloc] init];
    }
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    if ([self.element isEqualToString:@"title"])
    {
       [self.title appendString:string];
    }
    else if ([self.element isEqualToString:@"description"])
    {
        [self.descriptionString appendString:string];
    }
    
}


- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
   
    if ([elementName isEqualToString:@"item"]) {
        [self.feeds addObject:[self addImageLink:_item]];
    } else if ([elementName isEqualToString:@"title"]) {
        [_item setValue:self.title forKey:@"title"];
    } else if ([elementName isEqualToString:@"description"]) {
        [_item setValue:self.descriptionString forKey:@"description"];
    }

 }

// Document handling methods
- (void)parserDidStartDocument:(NSXMLParser *)parser{
        self.feeds = [[NSMutableArray alloc] init];
}


// sent when the parser begins parsing of the document.
- (void)parserDidEndDocument:(NSXMLParser *)parser {
   // NSLog(@"Feeds: %@",self.feeds);
    if (![self.feeds count]) {
        NSLog(@"Some times the url does not provide feeds. please wait and try again.");
    }
    
    if ([self.delegate respondsToSelector:@selector(XMLResultReturn:)]) {
        [self.delegate XMLResultReturn:self.feeds];
    }

    [NewsOperationManager addData:self.feeds];
}




-(NSDictionary *)addImageLink:(NSDictionary *)news {
    
    NSMutableDictionary *updatedNews = [[NSMutableDictionary alloc] init];
    NSString* validURL = [[news valueForKey:@"description"] extractImageURL];
    [updatedNews addEntriesFromDictionary:news];
    [updatedNews setObject:[NSString stringWithFormat:@"http:%@",validURL] forKey:@"imageURL"];
    return updatedNews;
    
}

@end
