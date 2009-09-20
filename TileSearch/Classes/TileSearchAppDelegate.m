//
//  TileSearchAppDelegate.m
//  TileSearch
//
//  Created by Toby Boudreaux on 12/29/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "TileSearchAppDelegate.h"
#import "TileSearchViewController.h"

@implementation TileSearchAppDelegate

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
