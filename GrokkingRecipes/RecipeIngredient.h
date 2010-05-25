//
//  RecipeIngredient.h
//  GrokkingRecipes
//
//  Created by Akshay on 5/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Recipe.h"

@interface RecipeIngredient : NSManagedObject {

}

@property(readwrite, copy) NSString *name;
@property(readwrite, retain) NSNumber *quantity;
@property(readwrite, copy) NSString *unitOfMeasure;
@property(readwrite, retain) Recipe *recipe;
@end
