//
//  NetworkPromptAppDelegate.m
//  NetworkPrompt
//
//  Created by Toby Boudreaux on 2/21/09.
//  Copyright CTO, The Barbarian Group 2009. All rights reserved.
//

#import "NetworkPromptAppDelegate.h"
#import "RootViewController.h"


@implementation NetworkPromptAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
	// Save data if appropriate
}


- (void)dealloc
{
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
