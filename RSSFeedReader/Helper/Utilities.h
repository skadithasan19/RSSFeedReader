

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject

/**
 @param title are message are required to create Alert
 */

+ (void)showAlertViewWithTitle:(NSString *)title alertMessage:(NSString *)message viewController:(UIViewController *)controller;

@end
