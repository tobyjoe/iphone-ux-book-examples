#import "GalleryView.h"

@implementation GalleryView

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
		self.backgroundColor = [UIColor blackColor];
		self.scrollEnabled = YES;
		self.pagingEnabled = YES;
		self.bounces = YES;
		self.directionalLockEnabled = NO;
    }
    return self;
}

- (void)addImage:(UIImage *)image
{
	int imageCount = [self.subviews count];
	float newContentWidth = ((float)imageCount + 1.0) * 320.0;
	CGSize newContentSize = CGSizeMake(newContentWidth, 460.0);
	UIImageView *imageView = [[UIImageView alloc]
		initWithFrame:CGRectMake((imageCount * 320.0), 0.0, 320.0, 460.0)];

	self.contentSize = newContentSize;

	imageView.image = image;
	[self addSubview:imageView];
	[imageView release];
}

@end
