//
//  TouchAndHoldAppDelegate.h
//  TouchAndHold
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
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

