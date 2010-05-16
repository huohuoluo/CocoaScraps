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

-(void)dealloc
{
	[name release];
	[super dealloc];
}

@end
