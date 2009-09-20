//
//  ChoreListAppDelegate.m
//  ChoreList
//
//  Created by Toby Boudreaux on 5/21/09.
//  Copyright Toby Boudreaux 2009. All rights reserved.
//

#import "ChoreListAppDelegate.h"
#import "RootViewController.h"


@implementation ChoreListAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

