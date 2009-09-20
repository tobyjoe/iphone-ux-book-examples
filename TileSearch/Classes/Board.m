#import "Board.h"
#import "Tile.h"

@interface Board (PrivateMethods)
- (void)setup;
@end

@implementation Board

#define NUMBER_OF_ROWS 2
#define NUMBER_OF_COLUMNS 4
#define TILE_SIZE 80.0
#define PADDING = (320.0 / (NUMBER_OF_COLUMNS * TILE_SIZE))

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		colors = [NSDictionary dictionaryWithObjectsAndKeys:
				  [UIImage imageNamed:@"blue.png"], @"blue",
				  [UIImage imageNamed:@"red.png"], @"red",
				  [UIImage imageNamed:@"green.png"], @"green",
				  [UIImage imageNamed:@"purple.png"], @"purple",
				  nil];
		[self setup];
	}
	return self;
}

- (void)removeAllTiles
{
	Tile *tile;
	for(tile in tiles){
		[tile release];
		[tile removeFromSuperview];
	}
}

- (void)setup
{
	if(tiles != nil){
		[self removeAllTiles];
		[tiles release];
	}

	int count = NUMBER_OF_ROWS * NUMBER_OF_COLUMNS;
	tiles = [[NSMutableArray arrayWithCapacity:count] retain];
	Tile *tile;
	CGRect frame = CGRectMake(0.0, 0.0, TILE_SIZE, TILE_SIZE);
	NSString *randomKey;
	NSArray *keys = [colors allKeys];
	NSUInteger n = [keys count];

	srand(time(NULL));
	
	while(count--){
		randomKey = [keys objectAtIndex:(rand() % n)];
		tile = [[Tile alloc] initWithFrame:frame
									 image:[colors valueForKey:randomKey]
								 colorName:randomKey];
		[tiles addObject:tile];
		[self addSubview:tile];
	}
	[self filterForColorName:@"*"];
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	Tile *tile;
	int row = -1;
	int col = 0;
	int n = 0;

	for(tile in tiles){
		if(n++ % NUMBER_OF_COLUMNS == 0){
			row++;
			col = 0;
		}else{
			col++;
		}

		float x = (TILE_SIZE / 2) + ((col * TILE_SIZE));
		float y = (TILE_SIZE / 2) + ((row * TILE_SIZE));

		CGPoint p = CGPointMake(x, y);
		if([[self subviews] containsObject:tile] == false){
			[self addSubview:tile];
		}

		tile.center = p;
	}
}

- (void)filterForColorName:(NSString *)colorName
{
	if([colorName isEqualToString:@"*"]){
		return;
	}

	Tile *tile;
	for(tile in tiles){
		NSComparisonResult result = [tile.colorName compare:colorName options:NSCaseInsensitiveSearch range:NSMakeRange(0, [colorName length])];
		if (result == NSOrderedSame){
			[tile highlight];
		}else{
			[tile dim];
		}
	}

	[self setNeedsLayout];
}


- (void)dealloc {
    [self removeAllTiles];
	[tiles release];
	[super dealloc];
}


@end
