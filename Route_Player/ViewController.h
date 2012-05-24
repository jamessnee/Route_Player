//
//  ViewController.h
//  Route_Player
//
//  Created by James Snee on 23/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController{
	NSArray *currentPlaylist;
	MPMusicPlayerController *musicPlayerController;
}

@property(strong)MPMusicPlayerController *musicPlayerController;
@property(strong)IBOutlet UIDatePicker *timePicker;
@property(strong)NSArray *currentPlaylist;
@property(strong)IBOutlet UITextView *playlistView;

-(IBAction)goButton:(id)sender;
-(IBAction)stopButton:(id)sender;
-(void)startPlayback;
-(void)stopPlayback;


@end
