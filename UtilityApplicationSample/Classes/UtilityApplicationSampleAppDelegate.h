//
//  UtilityApplicationSampleAppDelegate.h
//  UtilityApplicationSample
//
//  Created by Toby Boudreaux on 11/2/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface UtilityApplicationSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RootViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;

@end

