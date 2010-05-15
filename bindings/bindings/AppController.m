//
//  AppController.m
//  bindings
//
//  Created by Akshay on 5/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

-(IBAction) increment:(id)sender 
{
	NSNumber *m = [self valueForKey:@"measure"];
	NSNumber *mpp = [NSNumber numberWithInt:[m intValue] + 1];
	[self setValue:mpp forKey:@"measure"];
}

-(IBAction) decrement:(id)sender 
{
	NSNumber *m = [self valueForKey:@"measure"];
	NSNumber *mmm = [NSNumber numberWithInt:[m intValue] - 1];
	[self setValue:mmm forKey:@"measure"];
}

@end
