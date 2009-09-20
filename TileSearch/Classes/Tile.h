#import <UIKit/UIKit.h>

@interface Tile : UIImageView {
	NSString *colorName;
}

- (id)initWithFrame:(CGRect)frame image:(UIImage *)img colorName:(NSString *)colorName;
- (void)dim;
- (void)highlight;

@property (nonatomic, copy) NSString *colorName;

@end
