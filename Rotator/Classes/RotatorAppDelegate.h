//
//  RotatorAppDelegate.h
//  Rotator
//
//  Created by Toby Boudreaux on 2/3/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RotatorViewController;

@interface RotatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RotatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RotatorViewController *viewController;

@end

