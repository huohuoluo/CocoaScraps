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

-(void)testShouldInitializeWindowControllerOnApplicationDidFinishLaunching
{
	AppDelegate *appDelegate = [[AppDelegate alloc] init];
	id appDelegateMock = [OCMockObject partialMockForObject:appDelegate];
	id mainMenuController = [OCMockObject mockForClass:[MainMenuController class]];
	id window = [OCMockObject mockForClass:[NSWindow class]];
	
	[[window expect] makeKeyAndOrderFront:appDelegate];
	[[[mainMenuController expect] andReturn:window] window];
	[[[appDelegateMock expect] andReturn:mainMenuController] newWindowController];
	
	[appDelegateMock applicationDidFinishLaunching:nil];
	
	[mainMenuController verify];
	[window verify];
	
	STAssertEqualObjects(mainMenuController, [appDelegate mainMenuController], @"");
}

@end
