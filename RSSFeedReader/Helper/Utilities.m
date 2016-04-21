
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

/**
 @param title are message are required to create Alert
 */

+ (void)showAlertViewWithTitle:(NSString *)title alertMessage:(NSString *)message viewController:(UIViewController *)controller {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert]; // 7
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        
    }]; // 8
    
    [alert addAction:defaultAction]; // 9
    
    [controller presentViewController:alert animated:YES completion:nil]; // 11
}

@end
