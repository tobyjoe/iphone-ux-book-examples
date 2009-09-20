#import <UIKit/UIKit.h>
#import "SettingsViewControllerDelegate.h"
@class SettingsViewController;
@class BaseView;

@interface PEDemoAppDelegate : NSObject <UIApplicationDelegate, SettingsViewControllerDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;

	BaseView *baseView;
	SettingsViewController *settingsViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (void)settingsViewControllerDidSaveSettings;
- (BOOL)soundsEnabled;

@end

