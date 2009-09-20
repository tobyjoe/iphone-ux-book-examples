//
//  SearchView.h
//  Rotator
//
//  Created by Toby Boudreaux on 2/3/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchView : UIView {
	IBOutlet UISearchBar *searchBar;
}

@property (nonatomic, retain) UISearchBar *searchBar;

@end
