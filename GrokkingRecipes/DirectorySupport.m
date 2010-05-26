//
//  DirectorySupport.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DirectorySupport.h"


@implementation DirectorySupport

+ (NSString *)applicationSupportFolder
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
	return [basePath stringByAppendingPathComponent:@"GrokkingRecipes"];
}

@end
