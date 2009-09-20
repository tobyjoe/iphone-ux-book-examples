//
//  ModalButton.m
//  ModalButton
//
//  Created by Toby Boudreaux on 12/22/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "ModalButton.h"

@interface ModalButton (PrivateMethods)
- (void)handleTap;
@end

@implementation ModalButton

@synthesize mode;

- (id) init
{
	self = [self initWithFrame:CGRectMake(0.0, 0.0, 118.0, 118.0)];
	return self;
}


- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		mode = ModalButtonModeDefault;
		heart = [UIImage imageNamed:@"heart.png"];
		clover = [UIImage imageNamed:@"clover.png"];
		
		indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		indicator.hidesWhenStopped = YES;
		[self addSubview:indicator];
		[self bringSubviewToFront:indicator];
		indicator.center = self.center;
		
		self.backgroundColor = [UIColor clearColor];
		[self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
		[self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
		self.titleEdgeInsets = UIEdgeInsetsMake(-90.0, 0, 0, 0);
		self.font = [UIFont fontWithName:@"Helvetica" size:12.0f];
		[self setBackgroundImage:heart forState:UIControlStateNormal];
		
		[self update:nil];
	}
	return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	if([self hitTest:[touch locationInView:self] withEvent:event]){
		[self handleTap];
	}
	
	[super touchesEnded:touches withEvent:event];
}

- (void)handleTap
{
	self.enabled = NO;
	NSString *title;
	switch(mode){
		case ModalButtonModeDownload:
			title = downloading;
			break;
		case ModalButtonModeInstall:
			title = installing;
			break;
		default:
			break;
	}
	[self setTitle:title forState:UIControlStateNormal];
	
	if([timer isValid]){
		[timer invalidate];
	}
	timer = [NSTimer timerWithTimeInterval:5.0 target:self selector:@selector(update:) userInfo:nil repeats:NO];
	[timer retain];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
	
	[indicator startAnimating];
}

- (void)update:(NSTimer *)theTimer
{
	NSString *title;
	// Toggle mode
	switch(mode){
		case ModalButtonModeDefault:
			mode = ModalButtonModeDownload;
			title = download;
			self.enabled = YES;
			break;
		case ModalButtonModeDownload:
			mode = ModalButtonModeInstall;
			title = install;
			self.enabled = YES;
			break;
		case ModalButtonModeInstall:
			mode = ModalButtonModeComplete;
			title = complete;
			[self setBackgroundImage:clover forState:UIControlStateNormal];
			self.enabled = NO;
			break;
		default:
			self.enabled = NO;
			return;
	}
	[self setTitle:title forState:UIControlStateNormal];
	
	if([timer isValid]){
		[timer invalidate];
	}
	[indicator stopAnimating];
}

- (void)dealloc
{
	if([timer isValid]){
		[timer invalidate];
	}
	[timer release];
	[indicator release];
	[super dealloc];
}
@end
