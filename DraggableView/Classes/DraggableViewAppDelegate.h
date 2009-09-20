//
//  DraggableViewAppDelegate.h
//  DraggableView
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
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

