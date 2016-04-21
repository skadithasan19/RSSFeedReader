

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell


/**
 @param obj news object. which contains all news information
 */
- (void)setNewsFeed:(News *)obj{
    
    self.newsTitle.text = obj.title;
    self.shortDescription.text = [obj.shortdescription extractShortDesctription];;
    dispatch_queue_t queue = dispatch_queue_create("downLoadPhoto",
                                                       DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(queue, ^(void) {
            UIImage *img = [UIImage imageWithData: obj.imageData];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.photo.image = img;
            });
        });
   
}
@end
