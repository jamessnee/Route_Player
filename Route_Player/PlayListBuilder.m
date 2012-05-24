//
//  PlayListBuilder.m
//  Route_Player
//
//  Created by James Snee on 24/05/2012.
//
//  Copyright (c) 2012 James Snee
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
//files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy
//modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
//Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
//Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE
//, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "PlayListBuilder.h"

//http://stackoverflow.com/questions/791232/canonical-way-to-randomize-an-nsarray-in-objective-c
static NSUInteger random_below(NSUInteger n) {
    NSUInteger m = 1;
    // Compute smallest power of two greater than n.
    // There's probably a faster solution than this loop, but bit-twiddling
    // isn't my specialty.
    do {
        m <<= 1;
    } while(m < n);
    NSUInteger ret;
    do {
        ret = random() % m;
    } while(ret >= n);
    return ret;
}

@implementation PlayListBuilder

//http://stackoverflow.com/questions/791232/canonical-way-to-randomize-an-nsarray-in-objective-c
+(NSArray *)shufflePlaylist:(NSArray *)songs{
	NSMutableArray *songs_m = [[NSMutableArray alloc]initWithArray:songs];
	for (NSUInteger i = [songs_m count]; i > 1; i--) {
		NSUInteger j = random_below(i);
		[songs_m exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
	}
	return songs_m;
}

+(NSArray *)fitForTime:(NSNumber *)secs withSongs:(NSArray *)songs{
	NSMutableArray *playlist = [[NSMutableArray alloc]init];
	NSInteger timeLeft = [secs integerValue];
	for(MPMediaItem *song in songs){
		NSInteger duration = [[song valueForProperty:MPMediaItemPropertyPlaybackDuration] integerValue];
		if (duration<timeLeft) {
			[playlist addObject:song];
			timeLeft = timeLeft - duration;
			NSLog(@"Time Left: %dsecs",timeLeft);
		}
	}
	NSLog(@"Found a playlist with timeleft=%dsecs",timeLeft);
	
	return playlist;
}

+(NSArray *)sortSongArray:(NSArray *)songs byType:(sortType)sType{
	NSArray *sorted = [songs sortedArrayUsingComparator:^NSComparisonResult(id a, id b){
		MPMediaItem *songA = (MPMediaItem *)a;
		MPMediaItem *songB = (MPMediaItem *)b;
		NSInteger compA;
		NSInteger compB;
		if(sType==RATING){
			compA = [[songA  valueForProperty:MPMediaItemPropertyRating] integerValue];
			compB = [[songB valueForProperty:MPMediaItemPropertyRating] integerValue];
		}else if(sType==PLAYCOUNT){
			compA = [[songA valueForProperty:MPMediaItemPropertyPlayCount] integerValue];
			compB = [[songB valueForProperty:MPMediaItemPropertyPlayCount] integerValue];
		}
		if(compA>compB)
			return NSOrderedAscending;
		else if(compA==compB)
			return NSOrderedSame;
		else
			return NSOrderedDescending;
	}];
	
	return sorted;
}

+(NSArray *)buildPlaylist:(NSNumber *)secs{
	MPMediaQuery *entireLibrary = [MPMediaQuery songsQuery];
	NSArray *libItems = [entireLibrary items];
	libItems = [self sortSongArray:libItems byType:RATING];
	libItems = [self fitForTime:secs withSongs:libItems];
	libItems = [self shufflePlaylist:libItems];
	return libItems;
}

@end
