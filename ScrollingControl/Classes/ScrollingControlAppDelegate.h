//
//  ScrollingControlAppDelegate.h
//  ScrollingControl
//
//  Created by Toby Boudreaux on 1/2/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollingControlViewController;

@interface ScrollingControlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ScrollingControlViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ScrollingControlViewController *viewController;

@end

