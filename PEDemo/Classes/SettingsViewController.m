//
//  SettingsViewController.m
//  PEDemo
//
//  Created by Toby Boudreaux on 2/11/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize delegate;

- (void)viewDidLoad
{
	self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
}

- (IBAction)saveSettings
{
	/*
	// Write settings to bundle and let the delegate know.
	NSString *testValue = [[NSUserDefaults standardUserDefaults] stringForKey:kFirstNameKey];
	if (testValue == nil)
	{
		// no default values have been set, create them here based on what's in our Settings bundle info
		//
		NSString *pathStr = [[NSBundle mainBundle] bundlePath];
		NSString *settingsBundlePath = [pathStr stringByAppendingPathComponent:@"Settings.bundle"];
		NSString *finalPath = [settingsBundlePath stringByAppendingPathComponent:@"Root.plist"];
		
		NSDictionary *settingsDict = [NSDictionary dictionaryWithContentsOfFile:finalPath];
		NSArray *prefSpecifierArray = [settingsDict objectForKey:@"PreferenceSpecifiers"];
		
		NSString *firstNameDefault;
		NSString *lastNameDefault;
		NSNumber *nameColorDefault;
		NSNumber *backgroundColorDefault;
		
		NSDictionary *prefItem;
		for (prefItem in prefSpecifierArray)
		{
			NSString *keyValueStr = [prefItem objectForKey:@"Key"];
			id defaultValue = [prefItem objectForKey:@"DefaultValue"];
			
			if ([keyValueStr isEqualToString:kFirstNameKey])
			{
				firstNameDefault = defaultValue;
			}
			else if ([keyValueStr isEqualToString:kLastNameKey])
			{
				lastNameDefault = defaultValue;
			}
			else if ([keyValueStr isEqualToString:kNameColorKey])
			{
				nameColorDefault = defaultValue;
			}
			else if ([keyValueStr isEqualToString:kBackgroundColorKey])
			{
				backgroundColorDefault = defaultValue;
			}
		}
		
		// since no default values have been set (i.e. no preferences file created), create it here
		NSDictionary *appDefaults =  [NSDictionary dictionaryWithObjectsAndKeys:
									  firstNameDefault, kFirstNameKey,
									  lastNameDefault, kLastNameKey,
									  [NSNumber numberWithInt:1], kNameColorKey,
									  [NSNumber numberWithInt:1], kBackgroundColorKey,
									  nil];
		
		[[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
	
	// we're ready to do, so lastly set the key preference values
	firstName = [[NSUserDefaults standardUserDefaults] stringForKey:kFirstNameKey];
	lastName = [[NSUserDefaults standardUserDefaults] stringForKey:kLastNameKey];
	textColor = [[NSUserDefaults standardUserDefaults] integerForKey:kNameColorKey];
	backgroundColor = [[NSUserDefaults standardUserDefaults] integerForKey:kBackgroundColorKey];
	*/
	[self.delegate settingsViewControllerDidSaveSettings];
}

- (void)dealloc
{
    [super dealloc];
}


@end
