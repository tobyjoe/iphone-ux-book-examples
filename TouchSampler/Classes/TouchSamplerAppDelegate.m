//
//  TouchSamplerAppDelegate.m
//  TouchSampler
//
//  Created by Toby Boudreaux on 11/23/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "TouchSamplerAppDelegate.h"
#import "RootViewController.h"

@implementation TouchSamplerAppDelegate


@synthesize window;
@synthesize rootViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    [window addSubview:[rootViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [rootViewController release];
    [window release];
    [super dealloc];
}

@end
