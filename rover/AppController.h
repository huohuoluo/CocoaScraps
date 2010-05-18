//
//  AppController.h
//  rover
//
//  Created by Akshay on 5/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Orientation.h"

@interface AppController : NSObject {
	Orientation *orientation;
}

-(IBAction)turnLeft:(id)sender;
-(IBAction)turnRight:(id)sender;
-(IBAction)move:(id)sender;

@end
