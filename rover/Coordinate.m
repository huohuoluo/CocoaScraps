//
//  Coordinate.m
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Coordinate.h"


@implementation Coordinate

@synthesize x,y;

-(id)initWithX:(float)xCoordinate Y:(float)yCoordinate
{
	if(self = [super init])
	{
		x=xCoordinate;
		y=yCoordinate;
	}
	return self;
}

-(id)add:(Coordinate*)coordinate 
{
	float newX = x + [coordinate x];
	float newY = y + [coordinate y];
	return [Coordinate initializeWithX:newX Y:newY];
}

+(id)initializeWithX:(float)xCoordinate Y:(float)yCoordinate
{
	return [[Coordinate alloc] initWithX:xCoordinate Y:yCoordinate];
}

+(id) origin
{
	return [Coordinate initializeWithX:0.0 Y:0.0];
}

@end
