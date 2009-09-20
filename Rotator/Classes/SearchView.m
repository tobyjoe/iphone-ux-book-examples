//
//  SearchView.m
//  Rotator
//
//  Created by Toby Boudreaux on 2/3/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "SearchView.h"


@implementation SearchView

@synthesize searchBar;

- (void)dealloc {
	[searchBar release];
    [super dealloc];
}


@end
