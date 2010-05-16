//
//  Person.h
//  raiseman
//
//  Created by Akshay on 5/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString *name;
	float expectedRaise;
}

@property(readwrite, copy) NSString *name;
@property(readwrite, assign) float expectedRaise;

@end
