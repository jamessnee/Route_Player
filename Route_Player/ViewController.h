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
	MPMusicPlayerController *musicPlayerController;
}

@property(strong)MPMusicPlayerController *musicPlayerController;
@property(strong)IBOutlet UIDatePicker *timePicker;

-(IBAction)goButton:(id)sender;
-(void)buildPlaylist:(NSNumber *)secs;

@end
