#import <UIKit/UIKit.h>

@interface PickerDelegate : NSObject <UIPickerViewDelegate, UIPickerViewDataSource> {
	NSArray *content;
}

@end
