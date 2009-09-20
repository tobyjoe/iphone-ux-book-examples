//
//  ChoreListAppDelegate.h
//  ChoreList
//
//  Created by Toby Boudreaux on 5/21/09.
//  Copyright Toby Boudreaux 2009. All rights reserved.
//

@interface ChoreListAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

