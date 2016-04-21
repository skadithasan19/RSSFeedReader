

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "NSString+KeyString.h"

@implementation NSString (KeyString)

-(NSString *)removeWhiteSpace {
    return  [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


-(NSString*)extractImageURL {
    NSString *src = nil;
    NSScanner *theScanner = [NSScanner scannerWithString:self];
 
    [theScanner scanUpToString:@"<img" intoString:nil];
    if (![theScanner isAtEnd]) {
        [theScanner scanUpToString:@"src" intoString:nil];
        NSCharacterSet *charset = [NSCharacterSet characterSetWithCharactersInString:@"\"'"];
        [theScanner scanUpToCharactersFromSet:charset intoString:nil];
        [theScanner scanCharactersFromSet:charset intoString:nil];
        [theScanner scanUpToCharactersFromSet:charset intoString:&src];
    }
    
    return src;
}


-(NSString *)extractShortDesctription {

    NSArray *vv = [self componentsSeparatedByString:@"</font>"];
    NSString *result = @"";
    if ([vv count]) {
        NSString *tempString = [[[vv objectAtIndex:4] componentsSeparatedByString:@"<font size="] lastObject];
        NSString *shortString =[tempString substringFromIndex:[tempString rangeOfString:@">"].location];
        NSString *description = [shortString stringByReplacingOccurrencesOfString:@"</b>" withString:@""];
        NSCharacterSet *trim = [NSCharacterSet characterSetWithCharactersInString:@"</>"];
        result = [[description componentsSeparatedByCharactersInSet:trim] componentsJoinedByString:@""];
    }
    return result;
}

@end
