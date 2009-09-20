//
//  TwirlAppDelegate.m
//  Twirl
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "TwirlAppDelegate.h"
#import "TwirlViewController.h"

@implementation TwirlAppDelegate

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
