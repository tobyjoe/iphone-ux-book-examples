//
//  RootViewController.h
//  UITableViewSample
//
//  Created by Toby Boudreaux on 11/1/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondLevelViewController.h"

@interface RootViewController : UITableViewController {
	SecondLevelViewController *secondLevelViewController;
}

@end
