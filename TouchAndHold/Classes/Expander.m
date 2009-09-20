//
//  Expander.m
//  TouchAndHold
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "Expander.h"

@interface Expander (PrivateMethods)
- (void)stopTimer;
- (void)close;
- (void)expand:(NSTimer *)theTimer;
@end

@implementation Expander

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
		self.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
		self.backgroundColor = [UIColor redColor];

		expandedView = [[UIView alloc] initWithFrame:CGRectZero];
		expandedView.backgroundColor = [UIColor greenColor];
		expandedView.frame = CGRectMake(-100.0, -40.0, 140.0, 40.0);
		expandedView.hidden = YES;
		[self addSubview:expandedView];
}
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self stopTimer];
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0
											 target:self
										   selector:@selector(expand:)
										   userInfo:nil
											repeats:NO];
	[timer retain];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self stopTimer];
	[self close];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self stopTimer];
	[self close];
}

- (void)stopTimer
{
	if([timer isValid]){
		[timer invalidate];
	}	
}

- (void)expand:(NSTimer *)theTimer
{
	[self stopTimer];
	expandedView.hidden = NO;
}

- (void)close
{
	expandedView.hidden = YES;
}

- (void)dealloc
{
	[expandedView release];
    [super dealloc];
}

@end
