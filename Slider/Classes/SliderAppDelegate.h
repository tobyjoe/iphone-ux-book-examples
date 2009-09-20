//
//  SliderAppDelegate.h
//  Slider
//
//  Created by Toby Boudreaux on 12/27/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SliderViewController;

@interface SliderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SliderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SliderViewController *viewController;

@end

