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

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator:(NSString *)fileStore;
{
	if (persistentStoreCoordinator) return persistentStoreCoordinator;
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *path = [ManagedObjectContextFactory applicationSupportFolder];
	if ( ![fileManager fileExistsAtPath:path
							isDirectory:NULL] ) 
	{
		[fileManager createDirectoryAtPath:path
								attributes:nil];
	}
	
	path = [path stringByAppendingPathComponent:fileStore];
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

-(NSManagedObjectContext *)createXMLFileBased:(NSString *)filePath
{
	if (managedObjectContext) return managedObjectContext;
	NSPersistentStoreCoordinator *coord = [self persistentStoreCoordinator:filePath];
	managedObjectContext = [[NSManagedObjectContext alloc] init];
	[managedObjectContext setPersistentStoreCoordinator: coord];
	return managedObjectContext;	
}

-(NSManagedObjectContext *)createInMemory
{
	managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles: nil] retain];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: managedObjectModel];
	
	[persistentStoreCoordinator addPersistentStoreWithType: NSInMemoryStoreType
                                configuration: nil
                                          URL: nil
                                      options: nil 
                                        error: NULL];
	
    managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator: persistentStoreCoordinator];
	return managedObjectContext;
}

@end
