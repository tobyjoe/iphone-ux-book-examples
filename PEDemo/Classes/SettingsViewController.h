//
//  SettingsViewController.h
//  PEDemo
//
//  Created by Toby Boudreaux on 2/11/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewControllerDelegate.h"

@interface SettingsViewController : UIViewController {
	id <SettingsViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id delegate;

- (IBAction)saveSettings;

@end
