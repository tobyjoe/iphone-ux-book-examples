//
//  RootViewController.h
//  NetworkPrompt
//
//  Created by Toby Boudreaux on 2/21/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSMutableArray *services;
	NSMutableArray *outbox;
}

- (UITableViewCell *)placeholderCell;
- (void)showPrompt;

@end
