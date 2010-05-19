//
//  Direction.h
//  rover
//
//  Created by Akshay on 5/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Coordinate.h"

@interface Direction : NSObject <NSCopying> {
	NSString *name; 	
}

-(id)increment;
+(id)initialize:(NSString *)aName;

+(id)north;
+(id)east;
+(id)south;
+(id)west;

@end

extern Direction *North;
