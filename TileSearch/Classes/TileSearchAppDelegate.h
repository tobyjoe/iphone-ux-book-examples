//
//  TileSearchAppDelegate.h
//  TileSearch
//
//  Created by Toby Boudreaux on 12/29/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TileSearchViewController;

@interface TileSearchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TileSearchViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TileSearchViewController *viewController;

@end

