//
//  AppDelegate.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

-(IBAction)addImage:(id)sender 
{
	Recipe *selectedRecipe = [[recipeController selectedObjects] lastObject];
	if (selectedRecipe == nil) return;
	
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	[openPanel setCanChooseDirectories:NO];
	[openPanel setCanCreateDirectories:NO];
	[openPanel setAllowsMultipleSelection:NO];
	
	SEL openSelectedHandler = @selector(addImageSheetDidEnd:returnCode:contextInfo:);
	[openPanel beginSheetForDirectory:nil file:nil modalForWindow:window modalDelegate:self didEndSelector:openSelectedHandler contextInfo:selectedRecipe];
}

- (void)addImageSheetDidEnd:(NSOpenPanel*)openPanel returnCode:(NSInteger)returnCode contextInfo:(NSManagedObject*)recipe
{
	if(returnCode == NSCancelButton) return;
	NSString *fromPath = [openPanel filename];
	NSString *destinationPath = [ManagedObjectContextFactory applicationSupportFolder];
	NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
	[destinationPath stringByAppendingString:guid];
	NSError * error = nil;
	[[NSFileManager defaultManager] copyItemAtPath:fromPath toPath:destinationPath error:&error];
	if(error) [NSApp presentError:error];
	
	[recipe setValue:destinationPath forKey:@"imagePath"];
}


- (NSManagedObjectContext*)managedObjectContext
{
	if (managedObjectContext) return managedObjectContext;
	managedObjectContext = [[[ManagedObjectContextFactory alloc] init] create];
	return managedObjectContext;
}

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window 
{
	return [[self managedObjectContext] undoManager];
}

@end
