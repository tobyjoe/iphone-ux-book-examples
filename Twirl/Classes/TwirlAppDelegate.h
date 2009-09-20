//
//  TwirlAppDelegate.h
//  Twirl
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TwirlViewController;

@interface TwirlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TwirlViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TwirlViewController *viewController;

@end

