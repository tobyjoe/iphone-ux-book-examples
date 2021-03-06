//
//  PhotoView.h
//  BarGame
//
//  Created by Toby Boudreaux on 12/2/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoView : UIImageView {
	NSTimer *timer;
	BOOL hasMoved;
	BOOL isZoomed;
}


@property (nonatomic, assign) BOOL hasMoved;
@property (nonatomic, assign) BOOL isZoomed;

@end
