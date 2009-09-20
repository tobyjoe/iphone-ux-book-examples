//
//  SearchView.h
//  Rotator
//
//  Created by Toby Boudreaux on 2/3/09.
//  Copyright 2009 CTO, The Barbarian Group. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchView : UIView {
	IBOutlet UISearchBar *searchBar;
}

@property (nonatomic, retain) UISearchBar *searchBar;

@end
