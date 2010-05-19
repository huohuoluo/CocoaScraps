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
	NSLog(@"turnLeft");
}

-(IBAction)turnRight:(id)sender 
{
	NSLog(@"turnRight");	
}

-(IBAction)move:(id)sender 
{
	orientation = [orientation increment];
}

@end
