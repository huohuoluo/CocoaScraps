//
//  AppDelegate.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

@synthesize mainMenuController;

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	self.mainMenuController = [[MainMenuController initialize] autorelease];
	[[self.mainMenuController window] makeKeyAndOrderFront:self];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
	[self.mainMenuController close];
	self.mainMenuController = nil;
}

@end
