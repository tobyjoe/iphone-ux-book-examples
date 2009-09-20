//
//  TouchAndHoldAppDelegate.h
//  TouchAndHold
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchAndHoldViewController;

@interface TouchAndHoldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchAndHoldViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TouchAndHoldViewController *viewController;

@end

