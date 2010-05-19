//
//  AppController.m
//  rover
//
//  Created by Akshay on 5/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

-(id)init 
{
	if(self = [super init])
	{
		orientation = [[Orientation alloc] init];
	}
	return self;
}

-(IBAction)turnLeft:(id)sender 
{
	[orientation turnLeft];
}

-(IBAction)turnRight:(id)sender 
{
	[orientation turnRight];
}

-(IBAction)move:(id)sender 
{
	[self setValue:[orientation increment] forKey:@"orientation"];
//	NSLog(@"Direction: %s X:%f Y:%f", [[orientation direction] name], [[orientation coordinate] x], [[orientation coordinate] y]);
}

@end
