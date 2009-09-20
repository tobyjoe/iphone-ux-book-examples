//
//  ModalButtonAppDelegate.h
//  ModalButton
//
//  Created by Toby Boudreaux on 12/21/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalButtonViewController;

@interface ModalButtonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ModalButtonViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ModalButtonViewController *viewController;

@end

