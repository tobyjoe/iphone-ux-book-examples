#import <UIKit/UIKit.h>

@interface BaseView : UIView {
	BOOL isFlipped;
	UIToolbar *toolbar;
}

@property (nonatomic, retain) UIToolbar *toolbar;

- (void)flip;

@end
