#import <UIKit/UIKit.h>

@class DisclosureViewController;

@interface DisclosureAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DisclosureViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DisclosureViewController *viewController;

@end

