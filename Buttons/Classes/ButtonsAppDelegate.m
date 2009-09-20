//
//  ButtonsAppDelegate.m
//  Buttons
//
//  Created by Toby Boudreaux on 5/20/09.
//  Copyright Toby Boudreaux 2009. All rights reserved.
//

#import "ButtonsAppDelegate.h"
#import "ButtonsViewController.h"

@implementation ButtonsAppDelegate

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
