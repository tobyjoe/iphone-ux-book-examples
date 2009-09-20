//
//  OpenGLESSampleAppDelegate.m
//  OpenGLESSample
//
//  Created by Toby Boudreaux on 11/2/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "OpenGLESSampleAppDelegate.h"
#import "EAGLView.h"

@implementation OpenGLESSampleAppDelegate

@synthesize window;
@synthesize glView;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	glView.animationInterval = 1.0 / 60.0;
	[glView startAnimation];
}


- (void)applicationWillResignActive:(UIApplication *)application {
	glView.animationInterval = 1.0 / 5.0;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	glView.animationInterval = 1.0 / 60.0;
}


- (void)dealloc {
	[window release];
	[glView release];
	[super dealloc];
}

@end
