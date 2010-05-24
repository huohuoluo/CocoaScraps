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

- (NSString *)applicationSupportFolder
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
	return [basePath stringByAppendingPathComponent:@"GrokkingRecipes"];
}

- (void)addImageSheetDidEnd:(NSOpenPanel*)openPanel returnCode:(NSInteger)returnCode contextInfo:(NSManagedObject*)recipe
{
	if(returnCode == NSCancelButton) return;
	NSString *fromPath = [openPanel filename];
	NSString *destinationPath = [self applicationSupportFolder];
	NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
	[destinationPath stringByAppendingString:guid];
	NSError * error = nil;
	[[NSFileManager defaultManager] copyItemAtPath:fromPath toPath:destinationPath error:&error];
	if(error) [NSApp presentError:error];
	
	[recipe setValue:destinationPath forKey:@"imagePath"];
}


// CRAP

//START:managedObjectModel
- (NSManagedObjectModel*)managedObjectModel
{
	if (managedObjectModel) return managedObjectModel;
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"DataModel"
													 ofType:@"mom"];
	NSAssert(path != nil, @"Unable to find DataModel in main bundle");
	if (!path) return nil;
	
	NSURL *url = [NSURL fileURLWithPath:path];
	managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
	return managedObjectModel;
}
//END:managedObjectModel

//START:persistentStoreCoordinator
- (NSPersistentStoreCoordinator*)persistentStoreCoordinator;
{
	if (persistentStoreCoordinator) return persistentStoreCoordinator;
	
	NSString *filename = @"GrokkingRecipes.xml";
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *path = [self applicationSupportFolder];
	if ( ![fileManager fileExistsAtPath:path
							isDirectory:NULL] ) {
		[fileManager createDirectoryAtPath:path
								attributes:nil];
	}
	
	path = [path stringByAppendingPathComponent:filename];
	NSURL *url = [NSURL fileURLWithPath:path];
	NSManagedObjectModel *mom = [self managedObjectModel];
	persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] 
								  initWithManagedObjectModel:mom];
	
	NSError *error = nil;
	if (![persistentStoreCoordinator addPersistentStoreWithType:NSXMLStoreType
												  configuration:nil 
															URL:url 
														options:nil 
														  error:&error]) {
		[NSApp presentError:error];
	}
	return persistentStoreCoordinator;
}
//END:persistentStoreCoordinator

//START:managedObjectContext
- (NSManagedObjectContext*)managedObjectContext
{
	if (managedObjectContext) return managedObjectContext;
	
	NSPersistentStoreCoordinator *coord = [self persistentStoreCoordinator];
	
	if (!coord) return nil;
	
	managedObjectContext = [[NSManagedObjectContext alloc] init];
	[managedObjectContext setPersistentStoreCoordinator: coord];
	
	NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
	[request setEntity:[NSEntityDescription entityForName:@"Type"
								   inManagedObjectContext:managedObjectContext]];
	
	NSError *error = nil;
	NSArray *result = [managedObjectContext executeFetchRequest:request 
														  error:&error];
	NSAssert(error == nil, [error localizedDescription]);
	if ([result count]) return managedObjectContext;
	
	//The types table has not been populated
	NSArray *types;
	types = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"RecipeTypes"];
	
	for (NSString *type in types) {
		NSManagedObject *object = [NSEntityDescription 
								   insertNewObjectForEntityForName:@"Type" 
								   inManagedObjectContext:managedObjectContext];
		[object setValue:type forKey:@"name"];
	}
	
	return managedObjectContext;
}
//END:managedObjectContext

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window 
{
	return [[self managedObjectContext] undoManager];
}


@end
