//
//  AppController.h
//  bindings
//
//  Created by Akshay on 5/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {

	int measure;
}

-(IBAction) increment:(id)sender;
-(IBAction) decrement:(id)sender;
@end
