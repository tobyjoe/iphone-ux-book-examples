//
//  RootViewController.h
//  Companies
//
//  Created by Toby Boudreaux on 1/25/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompaniesAppDelegate.h"

@interface RootViewController : UITableViewController {
	CompaniesAppDelegate *appDelegate;
	NSArray *companies;
}

@end
