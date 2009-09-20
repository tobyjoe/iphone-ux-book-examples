//
//  Board.m
//  Tiles
//
//  Created by Toby Boudreaux on 12/4/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import "Board.h"

@interface Board (PrivateMethods)

- (void)setup;
- (void)toggleRelevantTilesForTouches:(NSSet *)touches andEvent:(UIEvent *)event;

@end


@implementation Board

@synthesize tiles, hasTiles;

- (id)initWithFrame:(CGRect)frame
{
	if(self = [super initWithFrame:frame]){
		[self setup];
	}
	return self;
}

- (void)addTile
{
	[tiles addObject:[[[Tile alloc] init] autorelease]];
}

- (void)removeTile:(Tile *)tile
{
	if([tiles containsObject:tile]){
		[tiles removeObject:tile];
		[tile disappear];
	}
	if([tiles count] < 1){
		self.hasTiles = NO;
	}else{
		self.hasTiles = YES;
	}
}

- (void)clear
{
	Tile *tile;
	for(tile in tiles){
		[self removeTile:tile];
	}
	self.hasTiles = NO;
}

- (void)willRemoveSubview:(UIView *)subview
{
	[self removeTile:(Tile *)subview];
}

- (IBAction)removeSelectedTiles
{
	Tile *tile;
	NSArray *tilesSnapshot = [NSArray arrayWithArray:tiles];
	for(tile in tilesSnapshot){
		if(tile.selected){
			[self removeTile:tile];
		}
	}
	if([tiles count] < 1){
		self.hasTiles = NO;
	}else{
		self.hasTiles = YES;
	}
}

#define NUM_COLS		4
#define NUM_ROWS		4
#define MARGIN_SIZE		2
#define TILE_COUNT		NUM_COLS * NUM_ROWS

- (void)setup
{
	if(tiles == nil){
		tiles = [NSMutableArray arrayWithCapacity:TILE_COUNT];
		[tiles retain];
	}
	for(int i = 0; i < TILE_COUNT; i++){
		[self addTile];
	}
	self.backgroundColor = [UIColor whiteColor];
	[self setNeedsDisplay];
}

- (void)layoutSubviews
{
	Tile *tile;
	int currentRow = 0;
	int currentColumn = 0;
	int i = 0;
	float tileSize = (320.0/NUM_COLS) - (MARGIN_SIZE * 1.25);
	float x, y;
	for(tile in tiles){
		//	Lay out the tile at the given location
		if([[self subviews] containsObject:tile] == false){
			[self addSubview:tile];
		}
		x = (currentColumn * tileSize) + (MARGIN_SIZE * (currentColumn + 1));
		y = (currentRow * tileSize) + (MARGIN_SIZE * (currentRow + 1));
		[tile appearWithSize:CGSizeMake(tileSize, tileSize) AtPoint:CGPointMake(x, y)];
		if(++i % 4 == 0){
			currentRow++;
			currentColumn = 0;
		}else{
			currentColumn++;
		}
		[tile setNeedsDisplay];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	currentTile = nil;
	[self toggleRelevantTilesForTouches:touches andEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	currentTile = nil;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	currentTile = nil;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self toggleRelevantTilesForTouches:touches andEvent:event];
}

- (void)deselectAllTiles
{
	Tile *tile;
	for(tile in tiles){
		tile.selected = NO;
	}
}

- (void)createSelectionSnapshot
{
	
}

- (void)restoreSelectionSnapshot
{
	
}

- (void)toggleRelevantTilesForTouches:(NSSet *)touches andEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	Tile *tile;
	CGPoint location;
	for(tile in tiles){
		location = [touch locationInView:tile];
		if([tile pointInside:location withEvent:event]){
			//	if the touch is still over the same tile, get out
			if(tile == currentTile){
				continue;
			}
			[tile toggleSelected];
			currentTile = tile;
		}
	}

}

- (void)dealloc {
	[tiles release];
	[currentTile release];
    [super dealloc];
}


@end
