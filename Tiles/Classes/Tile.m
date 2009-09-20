//
//  Tile.m
//  Tiles
//
//  Created by Toby Boudreaux on 12/4/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize selected;

- (id)init
{
    if (self = [super init]) {
		self.backgroundColor = [UIColor clearColor];
		backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"on.png"]];
		[self addSubview:backgroundView];
		[self sendSubviewToBack:backgroundView];
		self.selected = NO;
		hasAppeared = NO;
	}
	return self;
}

- (void)moveToPoint:(CGPoint)point
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	CGRect frame = self.frame;
	frame.origin = point;
	self.frame = frame;
	[UIView commitAnimations];
}

- (void)appearWithSize:(CGSize)size AtPoint:(CGPoint)point
{
	//	If it's new, have it 'grow' into being
	if(!hasAppeared){
		CGRect frame = self.frame;
		frame.origin = point;
		frame.size = size;
		self.frame = frame;

		//	Shrink it
		CGAffineTransform shrinker = CGAffineTransformMakeScale(0.01, 0.01);
		self.transform = shrinker;

		//	Start the animations transaction
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.5];

		//	Grow it
		CGAffineTransform grower = CGAffineTransformScale(self.transform, 100.0, 100.0);
		self.transform = grower;
		
		//	Commit the transaction
		[UIView commitAnimations];

		//	Flag that I have been on screen
		hasAppeared = YES;
	}else{
		[self moveToPoint:point];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if([touch tapCount] == 2){
		[self removeFromSuperview];
	}else{
		[self.nextResponder touchesBegan:touches withEvent:event];
		return;
	}

}

- (void)disappear
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	CGAffineTransform transform = CGAffineTransformMakeScale(.001, .001);
	self.transform = transform;
	[UIView commitAnimations];
}

- (void)toggleSelected
{
	self.selected = !self.selected;
	if(self.selected){
		backgroundView.image = [UIImage imageNamed:@"off.png"];
	}else{
		backgroundView.image = [UIImage imageNamed:@"on.png"];
	}
}

- (void)drawRect:(CGRect)rect
{
	self.bounds = self.frame;
	backgroundView.frame = self.bounds;
}

- (void)dealloc
{
	[backgroundView release];
    [super dealloc];
}


@end
