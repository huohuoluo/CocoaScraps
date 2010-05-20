//
//  Orientation.m
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Orientation.h"


@implementation Orientation
@synthesize direction, coordinate;

-(id)initWithDirection:(Direction *)aDirection coordinate:(Coordinate *)aCoordinate
{
	if(self = [super init])
	{
		direction = aDirection;
		coordinate = aCoordinate;
	}
	return self;	
}

+(id)initializeWithDirection:(Direction *)direction coordinate:(Coordinate *)coordinate
{
	return [[Orientation alloc] initWithDirection:direction coordinate:coordinate];
}

-(id)init
{
	return [self initWithDirection:[Direction north] coordinate:[Coordinate origin]];
}

-(id)increment
{
	Coordinate *increment = [direction increment];
	return [[Orientation alloc] initWithDirection:direction coordinate:[coordinate add:increment]];
}

-(id)turnLeft
{
	return [[Orientation alloc] initWithDirection:[direction left] coordinate:coordinate];	
}

-(id)turnRight
{
	return [[Orientation alloc] initWithDirection:[direction right] coordinate:coordinate];	
}

@end
