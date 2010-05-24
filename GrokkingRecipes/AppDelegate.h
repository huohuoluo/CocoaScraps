//
//  AppDelegate.h
//  GrokkingRecipes
//
//  Created by Akshay on 5/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Recipe;

@interface AppDelegate : NSObject {
	IBOutlet NSArrayController *recipeController;
	IBOutlet NSWindow *window;

	NSPersistentStoreCoordinator *persistentStoreCoordinator;
	NSManagedObjectModel *managedObjectModel;
	NSManagedObjectContext *managedObjectContext;
	
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSManagedObjectModel *)managedObjectModel;
- (NSManagedObjectContext *)managedObjectContext;


-(IBAction)addImage:(id)sender;

@end
