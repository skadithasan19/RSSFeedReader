

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *shortDescription;

/**
 @param obj news object. which contains all news information
 */

-(void)setNewsFeed:(News *)obj;

@end
