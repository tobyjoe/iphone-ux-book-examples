#import <UIKit/UIKit.h>

@class FrontView;
@class BackView;

@interface FlipperView : UIView {
	BOOL isFlipped;
	FrontView *frontView;
	BackView *backView;
}

@property (assign) BOOL isFlipped;

- (void)toggle;

@end
