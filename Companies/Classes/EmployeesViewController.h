//
//  EmployeesViewController.h
//  Companies
//
//  Created by Toby Boudreaux on 1/25/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"

@interface EmployeesViewController : UITableViewController {
	NSMutableArray *employees;
	Company *company;
}

@property (nonatomic, retain) Company *company;

- (id)initWithCompany:(Company *)theCompany;

@end
