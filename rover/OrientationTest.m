//
//  OrientationTest.m
//  rover
//
//  Created by Akshay on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OrientationTest.h"
#import "Orientation.h"

@implementation OrientationTest

-(void) testShouldKnowNextIncrementWhenDirectionIsNorth
{
	Orientation *orientation = [Orientation initializeWithDirection:[Direction north] coordinate:[Coordinate initializeWithX:10 Y:5]];
	Orientation *newOrientation = [orientation increment];
	STAssertEquals([Direction north], [newOrientation direction], @"direction should not change on increment");
	STAssertEquals(10.0f, [[newOrientation coordinate] x], @"should not change x coordinate");
	STAssertEquals(6.0f, [[newOrientation coordinate] y], @"should increment y coordinate by 1");	
}

-(void) testShouldKnowNextIncrementWhenDirectionIsEast
{
	Orientation *orientation = [Orientation initializeWithDirection:[Direction east] coordinate:[Coordinate initializeWithX:10 Y:5]];
	Orientation *newOrientation = [orientation increment];
	STAssertEquals([Direction east], [newOrientation direction], @"direction should not change on increment");
	STAssertEquals(11.0f, [[newOrientation coordinate] x], @"should increment x coordinate by 1");
	STAssertEquals(5.0f, [[newOrientation coordinate] y], @"should not change y coordinate");	
}

-(void) testShouldKnowNextIncrementWhenDirectionIsSouth
{
	Orientation *orientation = [Orientation initializeWithDirection:[Direction south] coordinate:[Coordinate initializeWithX:10 Y:5]];
	Orientation *newOrientation = [orientation increment];
	STAssertEquals([Direction south], [newOrientation direction], @"direction should not change on increment");
	STAssertEquals(10.0f, [[newOrientation coordinate] x], @"should not change x coordinate");
	STAssertEquals(4.0f, [[newOrientation coordinate] y], @"should decrement y coordinate by 1");	
}

-(void) testShouldKnowNextIncrementWhenDirectionIsWest
{
	Orientation *orientation = [Orientation initializeWithDirection:[Direction west] coordinate:[Coordinate initializeWithX:10 Y:5]];
	Orientation *newOrientation = [orientation increment];
	STAssertEquals([Direction west], [newOrientation direction], @"direction should not change on increment");
	STAssertEquals(9.0f, [[newOrientation coordinate] x], @"should decrement x coordinate by 1");
	STAssertEquals(5.0f, [[newOrientation coordinate] y], @"should not change y coordinate");	
}

@end
