//
//  MyDocument.h
//  raiseman
//
//  Created by Akshay on 5/16/10.
//  Copyright __MyCompanyName__ 2010 . All rights reserved.
//


#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument
{
	NSMutableArray *employees;
}

-(void)setEmployees:(NSMutableArray *)e;

@end
