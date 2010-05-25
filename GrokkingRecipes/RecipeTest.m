//
//  RecipeTest.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RecipeTest.h"

@implementation RecipeTest

-(void)testTruth
{
	NSManagedObject *recipe;
	
	recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe"
											 inManagedObjectContext:context];
	
	[recipe setValue:@"Double Cheese Crunch" forKey:@"name"];
	STAssertEqualObjects(@"Double Cheese Crunch", [recipe name], @"recipe should have a name");
}

@end
