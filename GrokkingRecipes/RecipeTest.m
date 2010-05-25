//
//  RecipeTest.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RecipeTest.h"

@implementation RecipeTest

-(void)testShouldSaveAndLoadRecipeWithAttributesAndAssociations
{
	Recipe *recipe = [NSEntityDescription insertNewObjectForEntityForName:@"Recipe"
											 inManagedObjectContext:context];
	[recipe setValue:@"Double Cheese Crunch" forKey:@"name"];
	[recipe setValue:@"Very Tasty Stuff" forKey:@"desc"];
	[recipe setValue:@"~/foo.png" forKey:@"imagePath"];
	[recipe setValue:[NSNumber numberWithInt:3] forKey:@"serves"];
	[recipe setValue:@"Entree" forKey:@"type"];
	
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init]; 
	[request setEntity:[NSEntityDescription entityForName:@"Recipe" 
								   inManagedObjectContext:context]]; 
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = 'Double Cheese Crunch'"];
	[request setPredicate:predicate];
	
	NSArray *results = [context executeFetchRequest:request error:nil];
	STAssertEquals(1u, [results count], @"");

	Recipe *loadedRecipe = [results lastObject];

	STAssertEqualObjects(@"Double Cheese Crunch", [loadedRecipe name], @"recipe should have a name");
	STAssertEqualObjects(@"Very Tasty Stuff", [loadedRecipe desc], @"recipe should have a name");
	STAssertEqualObjects(@"~/foo.png", [loadedRecipe imagePath], @"recipe should have a name");
	STAssertEqualObjects([NSNumber numberWithInt:3], [loadedRecipe serves], @"");
	STAssertEqualObjects(@"Entree", [loadedRecipe type], @"");	
}

@end
