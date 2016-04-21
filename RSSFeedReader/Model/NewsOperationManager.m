
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import "NewsOperationManager.h"

@implementation NewsOperationManager

// Clearing Existing Data

+ (BOOL)clearExistingData {
 
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:EntityName inManagedObjectContext:[AppDelegate shareDelegate].managedObjectContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        [fetchRequest setEntity:entityDescription];
        
        fetchRequest.includesPropertyValues = NO;
        fetchRequest.includesSubentities = NO;
        
        NSError *error;
        NSArray *items = [[AppDelegate shareDelegate].managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (error) {
            NSLog(@"Error requesting items from Core Data: %@", [error localizedDescription]);
        }
        
        for (News *managedObject in items) {
            [[AppDelegate shareDelegate].managedObjectContext deleteObject:managedObject];
        }
        
        if (![[AppDelegate shareDelegate].managedObjectContext save:&error]) {
            NSLog(@"Error deleting %@ - error:%@", entityDescription, [error localizedDescription]);
            return NO;
        }
     
    return YES;
}


// Adding news to Entity
+ (void)addData:(NSArray *)myArray {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^(void) {
        
        NSArray *contents = [[NewsOperationManager alloc] fetchExistingFeed];
        
        for (int i = 0; i < [myArray count]; i++) {
            
            NSDictionary *obj = [myArray objectAtIndex:i];
            if([contents count] > i) { // Updating existing object
                News *oldData = [contents objectAtIndex:i];
                [oldData setTimeStamp:[NSDate date]];
                [oldData setTitle:[obj valueForKey:@"title"]];
                [oldData setShortdescription:[obj valueForKey:@"description"]];
                [oldData setImageURL:[obj valueForKey:@"imageURL"]];
                if(!oldData.imageData)
                [NewsOperationManager setNewImage:oldData url:[obj valueForKey:@"imageURL"]];
            } else {
                // inserting NewObject
                News *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:EntityName inManagedObjectContext:[AppDelegate shareDelegate].managedObjectContext];
                [newManagedObject setTimeStamp:[NSDate date]];
                [newManagedObject setTitle:[obj valueForKey:@"title"]];
                [newManagedObject setShortdescription:[obj valueForKey:@"description"]];
                [newManagedObject setImageURL:[obj valueForKey:@"imageURL"]];
                [NewsOperationManager setNewImage:newManagedObject url:[obj valueForKey:@"imageURL"]];
            }
            
        }
                
            // Save the context.
            NSError *error = nil;
            if (![[AppDelegate shareDelegate].managedObjectContext save:&error]) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        
    });
}


+ (void)setNewImage:(News *)newManagedObject url:(NSString *)imageURL {
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
        [newManagedObject setImageData:imgData];
}


-(NSArray *) fetchExistingFeed {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:EntityName inManagedObjectContext:[AppDelegate shareDelegate].managedObjectContext];
    [fetchRequest setEntity:entity];
    //  [fetchRequest setFetchBatchSize:5];
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    NSArray *result = [[AppDelegate shareDelegate].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        //        NSLog(@"%@", result);
        return result;
    }
    return nil;
}


@end
