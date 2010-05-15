//
//  AppController.m
//  speakline
//
//  Created by Akshay on 5/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

-(id)init
{
	[super init];
	speechSynthesizer = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
	[speechSynthesizer setDelegate:self];
	voices = [[NSSpeechSynthesizer availableVoices] retain];
	return self;
}	


-(IBAction)sayIt:(id)sender 
{
	NSString *text = [textField stringValue];
	if([text length]!=0) 
	{
		[speechSynthesizer startSpeakingString:text];
		[startButton setEnabled:NO];
		[stopButton setEnabled:YES];
		[voiceSelection setEnabled:NO];
	}
}

-(IBAction)stopIt:(id)sender
{
	[speechSynthesizer stopSpeaking];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking 
{
	[startButton setEnabled:YES];
	[stopButton setEnabled:NO];
	[voiceSelection setEnabled:YES];	
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView 
{
	return [voices count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	NSString *voice = [voices objectAtIndex:row];
	NSDictionary *voiceAttributes = [NSSpeechSynthesizer attributesForVoice:voice];
	return [voiceAttributes objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification 
{
	NSLog(@"selection changed");
	int selectedRow = [voiceSelection selectedRow];
	if(selectedRow != -1)
	{
		NSString *selectedVoice = [voices objectAtIndex:selectedRow];
		[speechSynthesizer setVoice:selectedVoice];
	}
}

@end
