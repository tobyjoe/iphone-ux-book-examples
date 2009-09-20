//
//  SliderAppDelegate.h
//  Slider
//
//  Created by Toby Boudreaux on 12/27/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
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

