//
//  AppDelegate.h
//  GrokkingRecipes
//
//  Created by Akshay on 5/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DirectorySupport.h"
@class ManagedObjectContextFactory;

@class AppDelegate;

@class Recipe;

@interface MainMenuController : NSWindowController {
	IBOutlet NSArrayController *recipeController;
	NSWindow *window;
	IBOutlet NSManagedObjectContext *managedObjectContext;	
}

+(id)initialize;
-(IBAction)addImage:(id)sender;
- (NSManagedObjectContext*)managedObjectContext;

@property(nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
