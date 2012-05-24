//
//  PlayListBuilder.h
//  Route_Player
//
//  Created by James Snee on 24/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

typedef enum {
	RATING,
	PLAYCOUNT,
	HYBRID
} sortType;

@interface PlayListBuilder : NSObject

+(NSArray *)buildPlaylist:(NSNumber *)secs;
+(NSArray *)sortSongArray:(NSArray *)songs byType:(sortType)sType;
+(NSArray *)fitForTime:(NSNumber *)secs withSongs:(NSArray *)songs;

@end
