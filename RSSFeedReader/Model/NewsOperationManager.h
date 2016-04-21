

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsOperationManager : NSObject

// clear existing news
+ (BOOL)clearExistingData;

// add news to local db
+ (void)addData:(NSArray *)myArray;

// fetch all feeds
- (NSArray *) fetchExistingFeed;

@end
