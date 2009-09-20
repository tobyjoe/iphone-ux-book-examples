//
//  ModalButton.h
//  ModalButton
//
//  Created by Toby Boudreaux on 12/22/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *download = @"Download";
static NSString *downloading = @"Downloading...";
static NSString *install = @"Install";
static NSString *installing = @"Installing...";
static NSString *complete = @"Complete!";

static UIImage *heart = nil;
static UIImage *clover = nil;

typedef enum {
	ModalButtonModeDefault = 0,
	ModalButtonModeDownload,
	ModalButtonModeInstall,
	ModalButtonModeComplete,
} ModalButtonMode;


@interface ModalButton : UIButton {
	ModalButtonMode mode;
	NSTimer *timer;
	UIActivityIndicatorView *indicator;
}

@property (readonly) ModalButtonMode mode;

- (void)update:(NSTimer *)theTimer;

@end
