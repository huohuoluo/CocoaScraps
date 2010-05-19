//
//  Coordinate.h
//  rover
//
//  Created by Akshay on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Coordinate : NSObject {
	int x;
	int y;
}

@property(nonatomic, assign) int x;
@property(nonatomic, assign) int y;

-(id)add:(Coordinate*)coordinate;
+(id)origin;
+(id)initializeWithX:(int)xCoordinate Y:(int)yCoordinate;
@end

