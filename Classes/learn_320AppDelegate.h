//
//  learn_320AppDelegate.h
//  learn_320
//
//  Created by Tony Hillerson on 12/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <Three20/Three20.h>

@interface learn_320AppDelegate : NSObject <UIApplicationDelegate> {

  NSManagedObjectModel *managedObjectModel;
  NSManagedObjectContext *managedObjectContext;	    
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
	
	UINavigationController *navigationController;
	
	UIWindow *window;
}

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (NSString *)applicationDocumentsDirectory;

@end

