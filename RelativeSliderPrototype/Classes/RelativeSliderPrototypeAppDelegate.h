//
//  RelativeSliderPrototypeAppDelegate.h
//  RelativeSliderPrototype
//
//  Created by Toby Boudreaux on 2/5/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RelativeSliderPrototypeViewController;

@interface RelativeSliderPrototypeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RelativeSliderPrototypeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RelativeSliderPrototypeViewController *viewController;

@end

