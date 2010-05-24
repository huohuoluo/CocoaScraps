//
//  ManagedObjectContextFactory.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ManagedObjectContextFactory.h"


@implementation ManagedObjectContextFactory

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

+ (NSString *)applicationSupportFolder
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
	return [basePath stringByAppendingPathComponent:@"GrokkingRecipes"];
}

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator;
{
	if (persistentStoreCoordinator) return persistentStoreCoordinator;
	
	NSString *filename = @"GrokkingRecipes.xml";
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *path = [ManagedObjectContextFactory applicationSupportFolder];
	if ( ![fileManager fileExistsAtPath:path
							isDirectory:NULL] ) 
	{
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
														  error:&error]) 
	{
		[NSApp presentError:error];
	}
	return persistentStoreCoordinator;
}

-(NSManagedObjectContext *)create
{
	if (managedObjectContext) return managedObjectContext;
	NSPersistentStoreCoordinator *coord = [self persistentStoreCoordinator];
	managedObjectContext = [[NSManagedObjectContext alloc] init];
	[managedObjectContext setPersistentStoreCoordinator: coord];
	return managedObjectContext;	
}

@end
