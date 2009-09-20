//
//  IndexedUITableViewSampleAppDelegate.m
//  IndexedUITableViewSample
//
//  Created by Toby Boudreaux on 11/1/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "IndexedUITableViewSampleAppDelegate.h"
#import "RootViewController.h"


@implementation IndexedUITableViewSampleAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
