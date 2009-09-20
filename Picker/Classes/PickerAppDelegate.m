//
//  PickerAppDelegate.m
//  Picker
//
//  Created by Toby Boudreaux on 12/24/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "PickerAppDelegate.h"
#import "PickerViewController.h"

@implementation PickerAppDelegate

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
