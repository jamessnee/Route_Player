//
//  ViewController.m
//  Route_Player
//
//  Created by James Snee on 23/05/2012.
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

#import "ViewController.h"
#import "PlayListBuilder.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timePicker,musicPlayerController,currentPlaylist,playlistView;

-(void)startPlayback{
	MPMediaItemCollection *mediaCollection = [[MPMediaItemCollection alloc]initWithItems:currentPlaylist];
	[musicPlayerController setQueueWithItemCollection:mediaCollection];
	[musicPlayerController play];
}

-(void)stopPlayback{
	[musicPlayerController stop];
}

-(IBAction)stopButton:(id)sender{
	[self stopPlayback];
}

-(IBAction)goButton:(id)sender{
	NSTimeInterval time = [timePicker countDownDuration];
	NSNumber *secs = [NSNumber numberWithDouble:time];
	currentPlaylist = [PlayListBuilder buildPlaylist:secs];
	NSMutableString *playlistStr = [[NSMutableString alloc]init];
	for(MPMediaItem *song in currentPlaylist){
		[playlistStr appendFormat:@"Artist: %@, Title: %@ \n",[song valueForProperty:MPMediaItemPropertyArtist],[song valueForProperty:MPMediaItemPropertyTitle]];
	}
	[playlistView setText:playlistStr];
	[self startPlayback];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	musicPlayerController = [MPMusicPlayerController applicationMusicPlayer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end