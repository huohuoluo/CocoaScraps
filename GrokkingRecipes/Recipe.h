//
//  Recipe.h
//  GrokkingRecipes
//
//  Created by Akshay on 5/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Recipe : NSManagedObject {

}

@property(readwrite, copy) NSString *name;
@property(readwrite, copy) NSString *desc;
@property(readwrite, copy) NSString *type;
@property(readwrite, copy) NSString *imagePath;
@property(readwrite, retain) NSNumber *serves;
@property(readwrite, retain) NSMutableSet *ingredients;

@end
