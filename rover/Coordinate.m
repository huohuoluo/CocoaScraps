//
//  Coordinate.m
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Coordinate.h"


@implementation Coordinate

-(id)initWithX:(float)xCoordinate Y:(float)yCoordinate
{
	if(self = [super init])
	{
		x=xCoordinate;
		y=yCoordinate;
	}
	return self;
}

+(Coordinate *) origin
{
	return [[Coordinate alloc] initWithX:0 Y:0];
}

@end
