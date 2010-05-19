//
//  Orientation.m
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Orientation.h"


@implementation Orientation

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

@end
