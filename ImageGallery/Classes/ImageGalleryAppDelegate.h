#import <UIKit/UIKit.h>

@class ImageGalleryViewController;

@interface ImageGalleryAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImageGalleryViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImageGalleryViewController *viewController;

@end

