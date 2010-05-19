//
//  CoordinateTest.m
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CoordinateTest.h"

@implementation CoordinateTest

-(void)testShouldKnowCoordinatesInXAndY
{
	Coordinate *coordinate = [Coordinate initializeWithX:10.0 Y:20.0];
	STAssertEquals(10.0f, [coordinate x], @"x coordinates must match");
	STAssertEquals(20.0f, [coordinate y], @"y coordinates must match");
}

-(void)testShouldAdd
{
	Coordinate *one = [Coordinate initializeWithX:10 Y:20];
	Coordinate *two = [Coordinate initializeWithX:5 Y:-10];	
	Coordinate *sum = [one add:two];
	STAssertEquals(15.0f, [sum x], @"x coodinates must add");
	STAssertEquals(10.0f, [sum y], @"y coodinates must add");
}

@end
