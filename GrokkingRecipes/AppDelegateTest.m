//
//  AppDelegateTest.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppDelegateTest.h"
#import "AppDelegate.h"

@implementation AppDelegateTest

-(void)testShouldInitializeAppWithAppDelegate
{
	id appDelegate = [[NSApplication sharedApplication] delegate];
	STAssertTrue([appDelegate isKindOfClass:[AppDelegate class]], @"app not initialized with correct app delegate");
}


@end
