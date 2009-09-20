//
//  SliderAppDelegate.m
//  Slider
//
//  Created by Toby Boudreaux on 12/27/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "SliderAppDelegate.h"
#import "SliderViewController.h"

@implementation SliderAppDelegate

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
