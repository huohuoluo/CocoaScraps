//
//  DirectionTest.m
//  rover
//
//  Created by Akshay on 5/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DirectionTest.h"
#import "Direction.h"

@implementation DirectionTest

-(void)testRightOfNorthShouldBeEast
{
	STAssertEquals([Direction east], [[Direction north] right], @"right of north should be east");
}

-(void)testRightOfEastShouldBeSouth
{
	STAssertEquals([Direction south], [[Direction east] right], @"right of east should be south");
}


-(void)testRightOfSouthShouldBeWest
{
	STAssertEquals([Direction west], [[Direction south] right], @"right of south should be west");
}

-(void)testRightOfWestShouldBeNorth
{
	STAssertEquals([Direction north], [[Direction west] right], @"right of west should be north");
}


-(void)testLeftOfNorthShouldBeWest
{
	STAssertEquals([Direction west], [[Direction north] left], @"left of north should be west");
}

-(void)testLeftOfWestShouldBeSouth
{
	STAssertEquals([Direction south], [[Direction west] left], @"left of west should be south");
}

-(void)testLeftOfSouthShouldBeEast
{
	STAssertEquals([Direction east], [[Direction south] left], @"left of south should be east");
}

-(void)testLeftOfEastShouldBeNorth
{
	STAssertEquals([Direction north], [[Direction east] left], @"left of east should be north");
}

@end
