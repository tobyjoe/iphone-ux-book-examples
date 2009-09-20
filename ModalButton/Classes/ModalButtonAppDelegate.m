//
//  ModalButtonAppDelegate.m
//  ModalButton
//
//  Created by Toby Boudreaux on 12/21/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "ModalButtonAppDelegate.h"
#import "ModalButtonViewController.h"

@implementation ModalButtonAppDelegate

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
