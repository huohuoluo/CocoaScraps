//
//  Orientation.h
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Coordinate.h"
#import "Direction.h"

@interface Orientation : NSObject {
	Direction *direction;
	Coordinate *coordinate;
}

+(id)initializeWithDirection:(Direction *)direction coordinate:(Coordinate *)coordinate;
-(id)increment;
-(id)turnLeft;
-(id)turnRight;

@property(readwrite, retain) Direction *direction;
@property(readwrite, retain) Coordinate *coordinate;

@end
