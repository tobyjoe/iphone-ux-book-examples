//
//  PickerAppDelegate.h
//  Picker
//
//  Created by Toby Boudreaux on 12/24/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PickerViewController;

@interface PickerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PickerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PickerViewController *viewController;

@end

