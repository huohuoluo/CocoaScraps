//
//  MainMenuTest.m
//  GrokkingRecipes
//
//  Created by Akshay on 5/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainMenuTest.h"


@implementation MainMenuTest

	-(void)setUp
	{
		windowController = [[AppDelegate alloc] init];
		window = [windowController window];	
	}

	-(void)tearDown
	{
		[windowController release];
		window = nil;		
	}

- (void)testNibName 
	{
    STAssertEqualObjects([windowController windowNibName], @"MyWindow",
						 @"The nib for this window should be MyWindow.nib");
	}

@end
