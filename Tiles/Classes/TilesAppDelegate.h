//
//  TilesAppDelegate.h
//  Tiles
//
//  Created by Toby Boudreaux on 12/4/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TilesViewController;

@interface TilesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TilesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TilesViewController *viewController;

@end

