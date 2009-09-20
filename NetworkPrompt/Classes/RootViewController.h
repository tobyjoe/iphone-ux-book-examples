//
//  RootViewController.h
//  NetworkPrompt
//
//  Created by Toby Boudreaux on 2/21/09.
//  Copyright CTO, The Barbarian Group 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSMutableArray *services;
	NSMutableArray *outbox;
}

- (UITableViewCell *)placeholderCell;
- (void)showPrompt;

@end
