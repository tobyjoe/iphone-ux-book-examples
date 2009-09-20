//
//  ScrollingControlAppDelegate.m
//  ScrollingControl
//
//  Created by Toby Boudreaux on 1/2/09.
//  Copyright CTO, The Barbarian Group 2009. All rights reserved.
//

#import "ScrollingControlAppDelegate.h"
#import "ScrollingControlViewController.h"

@implementation ScrollingControlAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
