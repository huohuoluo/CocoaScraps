//
//  Direction.m
//  rover
//
//  Created by Akshay on 5/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Direction.h"

@implementation Direction

+initialize:(NSString *)name
{
	return [[Direction alloc] initWithName:name];
}

-(id)initWithName:(NSString *)aName 
{
	if(self = [super init])
	{
		name = aName;
	}	
	return self;
}

-(NSMutableDictionary *)incrementSequence
{
	static NSMutableDictionary *increments = NULL;
	if(!increments)
	{
		increments = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[Coordinate initializeWithX:1 Y:0], [Direction north],
										   [Coordinate initializeWithX:0 Y:1], [Direction east],
										   [Coordinate initializeWithX:-1 Y:0], [Direction south],
										   [Coordinate initializeWithX:0 Y:-1], [Direction west],
										   nil
		 ];
	}
	return increments;
}

-(id)increment
{
	Coordinate *c = [[self incrementSequence] objectForKey:self];
	NSLog(@"%d - %d",[c x],  [c y]);
	return c;
}

-(NSArray *)turnSequence 
{
	static NSArray *turns = NULL;
	if(!turns)
	{
		[turns initWithObjects:[Direction north], [Direction east], [Direction south], [Direction west], nil];
	}
	return turns;
}

-(id)copyWithZone:(NSZone *)zone
{
	return self;
}

+(id)north
{
	static Direction *northDirection = NULL;
	if(!northDirection)
	{
		northDirection = [Direction initialize:@"North"];
	}
	return northDirection;
}

+(id)east
{
	static Direction *eastDirection = NULL;
	if(!eastDirection)
	{
		eastDirection = [Direction initialize:@"East"];
	}
	return eastDirection;
}

+(id)south
{
	static Direction *southDirection = NULL;
	if(!southDirection)
	{
		southDirection = [Direction initialize:@"South"];
	}
	return southDirection;
}

+(id)west
{
	static Direction *westDirection = NULL;
	if(!westDirection)
	{
		westDirection = [Direction initialize:@"West"];
	}
	return westDirection;
}

@end
