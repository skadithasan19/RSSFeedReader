

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface News : NSManagedObject
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * shortdescription;
@property (nonatomic, strong) NSString * imageURL;
@property (nonatomic, strong) NSData * imageData;
@property (nonatomic, strong) NSDate * timeStamp;
@end
