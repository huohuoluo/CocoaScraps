//
//  ManagedObjectContextFactory.h
//  GrokkingRecipes
//
//  Created by Akshay on 5/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ManagedObjectContextFactory : NSObject {
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
	NSManagedObjectModel *managedObjectModel;
	NSManagedObjectContext *managedObjectContext;	
}

-(NSManagedObjectContext *)createXMLFileBased:(NSString *)filePath;
-(NSManagedObjectContext *)createInMemory;
@end
