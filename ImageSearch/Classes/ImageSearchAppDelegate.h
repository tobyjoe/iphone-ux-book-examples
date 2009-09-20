//
//  ImageSearchAppDelegate.h
//  ImageSearch
//
//  Created by Toby Boudreaux on 11/16/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageSearchViewController;

@interface ImageSearchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImageSearchViewController *viewController;
	BOOL isForegroundApplication;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImageSearchViewController *viewController;

- (void) performSearch:(NSString *)searchTerm;

@end

