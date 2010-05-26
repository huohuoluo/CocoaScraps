//
//  AppDelegate.h
//  GrokkingRecipes
//
//  Created by Akshay on 5/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainMenuController.h"

@interface AppDelegate : NSObject {
	MainMenuController *mainMenuController;
}

@property(nonatomic, retain) MainMenuController *mainMenuController;
@end
