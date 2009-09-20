//
//  Draggable.m
//  DraggableView
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import "Draggable.h"


@implementation Draggable

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"Touched.");
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"Dragged.");
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self.superview];
	self.center = location;
}

@end
