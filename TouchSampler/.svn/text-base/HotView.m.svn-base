#import "HotView.h"

@implementation HotView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
		hot = true;
    }
    return self;
}

#define MARGIN_SIZE 10.0
#define DRAGGING_MARGIN_SIZE 40.0

- (BOOL) point:(CGPoint)point insideWithMargin:(float)margin
{
	CGRect rect = CGRectInset(self.bounds, -margin, -margin);
	return CGRectContainsPoint(rect, point);
}

- (BOOL) pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
	float phasedMargin;
	UITouch *touch = [[event touchesForView:self] anyObject];
	if(touch.phase != UITouchPhaseBegan){
		phasedMargin = DRAGGING_MARGIN_SIZE;
	}else{
		phasedMargin = MARGIN_SIZE;
	}

	if([self point:point insideWithMargin:phasedMargin]){
		return YES;
	}else{
		return NO;
	}
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"Touches began.");
	hot = YES;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(hot == false) return;
	CGPoint point = [[touches anyObject] locationInView:self];
	if([self point:point insideWithMargin:DRAGGING_MARGIN_SIZE] == false){
		[self.nextResponder touchesBegan:touches withEvent:event];
		hot = false;
		return;
	}

	NSLog(@"Touch moved.");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(hot == false) return;
	NSLog(@"Touches ended.");
	hot = true;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(hot == false) return;
	NSLog(@"Touches cancelled.");
	hot = true;
}

@end
