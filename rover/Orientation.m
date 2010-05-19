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

+(id)initializeWithDirection:(Direction *)direction coordinate:(Coordinate *)coordinate
{
	return [[Orientation alloc] initWithDirection:direction coordinate:coordinate];
}

-(id)initWithDirection:(Direction *)aDirection coordinate:(Coordinate *)aCoordinate
{
	if(self = [super init])
	{
		direction = aDirection;
		coordinate = aCoordinate;
	}
	return self;	
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
	direction = [direction left];
}

-(id)turnRight
{
	direction = [direction right];	
}

@end
