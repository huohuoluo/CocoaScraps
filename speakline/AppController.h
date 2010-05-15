//
//  AppController.h
//  speakline
//
//  Created by Akshay on 5/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
    IBOutlet NSTextField *textField;
	IBOutlet NSButton *startButton;
	IBOutlet NSButton *stopButton;
	NSSpeechSynthesizer *speechSynthesizer;
	NSArray *voices;
	IBOutlet NSTableView *voiceSelection;
}

-(IBAction)sayIt:(id)sender;
-(IBAction)stopIt:(id)sender;

@end
