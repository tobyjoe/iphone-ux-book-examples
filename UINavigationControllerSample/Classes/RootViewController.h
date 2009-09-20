//
//  RootViewController.h
//  UINavigationControllerSample
//
//  Created by Toby Boudreaux on 11/2/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
	BOOL allSetUp;
}

- (IBAction) pushNextViewController:(id)sender;
- (IBAction) backToRoot:(id)sender;

@end
