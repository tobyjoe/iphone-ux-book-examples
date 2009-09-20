//
//  UITabBarControllerSampleAppDelegate.m
//  UITabBarControllerSample
//
//  Created by Toby Boudreaux on 11/2/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "UITabBarControllerSampleAppDelegate.h"


@implementation UITabBarControllerSampleAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

