//
//  NetworkPromptAppDelegate.m
//  NetworkPrompt
//
//  Created by Toby Boudreaux on 2/21/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
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
