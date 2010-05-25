//
//  CoreDataTestCase.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CoreDataTestCase.h"


@implementation CoreDataTestCase

-(void)setUp
{
	[super setUp];
	context = [[[ManagedObjectContextFactory alloc] init] createInMemory];
}

-(void)tearDown
{	
	[context release];
	context = nil;
	[super tearDown];
}

@end
