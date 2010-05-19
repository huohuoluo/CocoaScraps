//
//  Coordinate.h
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Coordinate : NSObject {
	float x;
	float y;
}

@property(readwrite, assign) float x;
@property(readwrite, assign) float y;

-(id)add:(Coordinate*)coordinate;
-(id)initWithX:(float)xCoordinate Y:(float)yCoordinate;
+(id)origin;
+(id)initializeWithX:(float)xCoordinate Y:(float)yCoordinate;

@end

