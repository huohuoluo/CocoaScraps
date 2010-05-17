//
//  Person.m
//  raiseman
//
//  Created by Akshay on 5/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name;
@synthesize expectedRaise;

-(id)init
{
	[super init];
	name= @"Akshay";
	expectedRaise= 10.1;
	return self;
}

-(id)initWithCoder:(NSCoder *)coder
{
	name= [[coder decodeObjectForKey:@"name"] retain];
	expectedRaise=[coder decodeFloatForKey:@"expectedRaise"];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:name forKey:@"name"];
	[coder encodeFloat:expectedRaise forKey:@"expectedRaise"];
}

-(void)dealloc
{
	[name release];
	[super dealloc];
}

@end
