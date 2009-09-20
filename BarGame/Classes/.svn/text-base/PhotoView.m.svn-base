//
//  PhotoView.m
//  BarGame
//
//  Created by Toby Boudreaux on 12/2/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import "PhotoView.h"

@interface PhotoView (PrivateMethods)

- (void)reset;
- (void)animateSwipe:(int)direction;
- (void)singleTap:(NSTimer*)theTimer;
- (CGFloat)distanceFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;
- (void)transformScaleToDelta:(CGFloat)delta;

@end

@implementation PhotoView

@synthesize hasMoved;
@synthesize isZoomed;

#define HORIZ_SWIPE_DRAG_MIN    24
#define VERT_SWIPE_DRAG_MAX     24

#define TAP_MIN_DRAG            10
#define MINIMUM_SCALE			1.0

CGPoint startPosition;
CGFloat initialDistance;
CGFloat originalPix;

- (id)initWithFrame:(CGRect)frame
{
	if(self = [super initWithFrame:frame]){
		// Initialization code
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = YES;
		self.clipsToBounds = NO;
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self reset];
		originalPix = sqrt(self.frame.size.width * self.frame.size.height);
	}
	return self;
}

- (void)reset
{
	isZoomed = NO;
	hasMoved = NO;
	self.transform = CGAffineTransformIdentity;
}

- (void)setImage:(UIImage *)image
{
	[self reset];
	self.transform = CGAffineTransformIdentity;
	[super setImage:image];
}

- (CGFloat)distanceFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
	float x = toPoint.x - fromPoint.x;
	float y = toPoint.y - fromPoint.y;
	return sqrt(x * x + y * y);
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([timer isValid]){
		[timer invalidate];
	}
	
	hasMoved = NO;

	switch([touches count]){
		case 1:
		{
			// single touch
			UITouch * touch = [touches anyObject];
			startPosition = [touch locationInView:self];
			initialDistance = -1;
			break;
		}
		default:
		{
			// multi touch
			UITouch *touch1 = [[touches allObjects] objectAtIndex:0];
			UITouch *touch2 = [[touches allObjects] objectAtIndex:1];
			initialDistance = [self distanceFromPoint:[touch1 locationInView:self] 
													 toPoint:[touch2 locationInView:self]];
			break;
		}
			
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	UITouch *touch1 = [[touches allObjects] objectAtIndex:0];
	if([timer isValid]){
		[timer invalidate];
	}

	if(isZoomed && ([touches count] == 1)){
		CGPoint pos = [touch1 locationInView:self];
		self.transform = CGAffineTransformTranslate(self.transform, pos.x - startPosition.x, pos.y - startPosition.y);
		hasMoved = YES;
		return;
	}

	if((initialDistance > 0) && ([touches count] > 1)){
		UITouch *touch2 = [[touches allObjects] objectAtIndex:1];
		CGFloat currentDistance = [self distanceFromPoint:[touch1 locationInView:self] 
														 toPoint:[touch2 locationInView:self]];
		CGFloat pixelsMoved = currentDistance - initialDistance;
		if (pixelsMoved != 0) {
			[self transformScaleToDelta:pixelsMoved];
		}
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch1 = [[touches allObjects] objectAtIndex:0];
	if([touches count] == 1){
		// double tap to reset to default size
		if([touch1 tapCount] > 1){
			if(isZoomed){
				[self reset];
			}
			return;
		}
		CGPoint currentTouchPosition = [touch1 locationInView:self];
		
		float deltaX = fabsf(startPosition.x - currentTouchPosition.x);
		float deltaY = fabsf(startPosition.y - currentTouchPosition.y);
		// If the swipe tracks correctly.
		if((deltaX >= HORIZ_SWIPE_DRAG_MIN) && (deltaY <= VERT_SWIPE_DRAG_MAX)){
			// It appears to be a swipe.
			if (startPosition.x < currentTouchPosition.x){
				[self animateSwipe: 1];
			}else{
				[self animateSwipe: -1];
			}
		}else if(!hasMoved && ((deltaX <= TAP_MIN_DRAG) && (deltaY <= TAP_MIN_DRAG))){
			// Process a tap event.
			NSLog(@"Tap");
			timer = [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(singleTap:) userInfo:nil repeats:NO];
			[timer retain];
		}
	}else{
		// multi-touch
		UITouch *touch2 = [[touches allObjects] objectAtIndex:1];
		CGFloat finalDistance = [self distanceFromPoint:[touch1 locationInView:self] 
													   toPoint:[touch2 locationInView:self]];
		CGFloat pixelsMoved = finalDistance - initialDistance;
		if(pixelsMoved != 0){
			[self transformScaleToDelta:pixelsMoved];
			isZoomed = YES;
		}
	}
}

- (void)transformScaleToDelta:(CGFloat)delta
{
	CGFloat pix = sqrt(self.frame.size.width * self.frame.size.height);
	NSLog(@"pix, originalPix: (%f, %f)", pix, originalPix);
	if(pix < originalPix){
		pix = originalPix;
		[self reset];
		return;
	}
	CGFloat newScale = 1.0 + (delta / pix);
	self.transform = CGAffineTransformScale(self.transform, newScale, newScale);
}


- (void)singleTap:(NSTimer*)theTimer
{
	// must override
}

- (void)animateSwipe:(int)direction
{
	// must override
}

- (void)dealloc
{
	if([timer isValid]){
		[timer invalidate];
	}
	[super dealloc];
}

@end
