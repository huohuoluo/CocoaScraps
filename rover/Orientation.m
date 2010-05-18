//
//  Orientation.m
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Orientation.h"


@implementation Orientation

-(id)initWithDirection:(Direction)new_direction coordinate:(Coordinate *)new_coordinate
{
	if(self = [super init])
	{
		direction = new_direction;
		coordinate = new_coordinate;
	}
	return self;	
}

-(id)init
{
	return [self initWithDirection:North coordinate:[Coordinate origin]];
}

-(id)increment
{
	Orientation *newOrientation = [[Orientation alloc] initWithDirection:direction coordinate:coordinate];
	return newOrientation;
}

@end
