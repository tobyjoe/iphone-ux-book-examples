//
//  RelativeSliderPrototypeAppDelegate.m
//  RelativeSliderPrototype
//
//  Created by Toby Boudreaux on 2/5/09.
//  Copyright CTO, The Barbarian Group 2009. All rights reserved.
//

#import "RelativeSliderPrototypeAppDelegate.h"
#import "RelativeSliderPrototypeViewController.h"

@implementation RelativeSliderPrototypeAppDelegate

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
