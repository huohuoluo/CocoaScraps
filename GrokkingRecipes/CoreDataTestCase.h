//
//  CoreDataTestCase.h
//  GrokkingRecipes
//
//  Created by Akshay on 5/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <Cocoa/Cocoa.h>
#import "ManagedObjectContextFactory.h"

@interface CoreDataTestCase : SenTestCase 
{
	NSManagedObjectContext *context;
}

-(void)setUp;
-(void)tearDown;

@end
