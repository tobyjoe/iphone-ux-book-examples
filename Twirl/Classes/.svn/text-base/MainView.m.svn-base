//
//  MainView.m
//  Twirl
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import "MainView.h"

@interface MainView : UIView {
	Spinner *spinner;
}

@interface MainView (PrivateMethods)

- (void)transformSpinnerWithFirstTouch:(UITouch *)firstTouch andSecondTouch:(UITouch *)secondTouch;
- (CGFloat)distanceFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;
- (CGPoint)vectorFromPoint:(CGPoint)firstPoint toPoint:(CGPoint)secondPoint;

@end

@implementation MainView

- (void)awakeFromNib
{
	self.multipleTouchEnabled = YES;
	spinner = [[Spinner alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
	spinner.center = self.center;
	[self addSubview:spinner];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([touches count] != 2){
		return;
	}
	NSArray *allTouches = [touches allObjects];
	UITouch *firstTouch = [allTouches objectAtIndex:0];
	UITouch *secondTouch = [allTouches objectAtIndex:1];
	[self transformSpinnerWithFirstTouch:firstTouch andSecondTouch:secondTouch];
}

- (void)transformSpinnerWithFirstTouch:(UITouch *)firstTouch andSecondTouch:(UITouch *)secondTouch
{
	CGPoint firstTouchLocation = [firstTouch locationInView:self];
	CGPoint firstTouchPreviousLocaion = [firstTouch previousLocationInView:self];
	CGPoint secondTouchLocation = [secondTouch locationInView:self];
	CGPoint secondTouchPreviousLocation = [secondTouch previousLocationInView:self];
	CGPoint previousDifference = [self vectorFromPoint:firstTouchPreviousLocaion toPoint:secondTouchPreviousLocation];
	CGAffineTransform newTransform = CGAffineTransformScale(spinner.transform, 1.0, 1.0);
	CGFloat previousRotation = atan2(previousDifference.y, previousDifference.x);
	CGPoint currentDifference = [self vectorFromPoint:firstTouchLocation toPoint:secondTouchLocation];
	CGFloat currentRotation = atan2(currentDifference.y, currentDifference.x);
	CGFloat newAngle = currentRotation - previousRotation;
	newTransform = CGAffineTransformRotate(newTransform, newAngle);
	spinner.transform = newTransform;
}

- (CGFloat)distanceFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
	float x = toPoint.x - fromPoint.x;
	float y = toPoint.y - fromPoint.y;
	return hypot(x, y);
}

- (CGPoint)vectorFromPoint:(CGPoint)firstPoint toPoint:(CGPoint)secondPoint
{
	CGFloat x = firstPoint.x - secondPoint.x;
	CGFloat y = firstPoint.y - secondPoint.y;
	CGPoint result = CGPointMake(x, y);
	return result;
}


- (void) dealloc
{
	[spinner release];
	[super dealloc];
}

@end
