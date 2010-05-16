//
//  MyDocument.h
//  raiseman
//
//  Created by Akshay on 5/16/10.
//  Copyright __MyCompanyName__ 2010 . All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import "Person.h"

@interface MyDocument : NSDocument
{
	NSMutableArray *employees;
}

-(void)setEmployees:(NSMutableArray *)e;

-(void)insertObject:(Person *)p inEmployeesAtIndex:(int)index;
-(void)removeObjectFromEmployeesAtIndex:(int)index;

@end
