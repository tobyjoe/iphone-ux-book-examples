//
//  UtilityApplicationSampleAppDelegate.m
//  UtilityApplicationSample
//
//  Created by Toby Boudreaux on 11/2/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "UtilityApplicationSampleAppDelegate.h"
#import "RootViewController.h"

@implementation UtilityApplicationSampleAppDelegate


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
