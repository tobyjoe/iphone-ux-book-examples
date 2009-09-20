//
//  DraggableViewAppDelegate.h
//  DraggableView
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DraggableViewViewController;

@interface DraggableViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DraggableViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DraggableViewViewController *viewController;

@end

