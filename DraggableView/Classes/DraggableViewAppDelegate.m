//
//  DraggableViewAppDelegate.m
//  DraggableView
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "DraggableViewAppDelegate.h"
#import "DraggableViewViewController.h"

@implementation DraggableViewAppDelegate

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
