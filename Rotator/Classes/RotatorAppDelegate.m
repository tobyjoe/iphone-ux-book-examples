//
//  RotatorAppDelegate.m
//  Rotator
//
//  Created by Toby Boudreaux on 2/3/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "RotatorAppDelegate.h"
#import "RotatorViewController.h"

@implementation RotatorAppDelegate

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
