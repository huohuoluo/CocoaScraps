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

+(Coordinate *)origin;
@end
