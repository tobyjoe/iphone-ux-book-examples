//
//  CompaniesAppDelegate.h
//  Companies
//
//  Created by Toby Boudreaux on 1/25/09.
//  Copyright CTO, The Barbarian Group 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompaniesAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
	NSArray *companies;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSArray *companies;

@end

