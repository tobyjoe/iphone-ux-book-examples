//
//  RotatorViewController.h
//  Rotator
//
//  Created by Toby Boudreaux on 2/3/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchView.h"

@interface RotatorViewController : UIViewController {
	UIImage *portraitImage;
	UIImage *landscapeImage;
	UIImageView *blurView;
	SearchView *view;
}

@end

