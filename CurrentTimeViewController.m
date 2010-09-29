//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by Chris Readle (GMC-MSV-IT CONTRACTOR) on 9/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"


@implementation CurrentTimeViewController

-(id)init 
{
	[super initWithNibName:@"CurrentTimeViewController"
					bundle:nil];
	
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:@"Time"];
	
	UIImage *image = [UIImage imageNamed:@"Time.png"];
	[tbi setImage:image];
	
	return self;
}

- (IBAction)showCurrentTime:(id)sender
{
	NSDate *now = [NSDate date];
	static NSDateFormatter *formatter = nil;
	if (!formatter) {
		formatter = [[NSDateFormatter alloc] init];
		[formatter setTimeStyle:NSDateFormatterShortStyle];
	}
	[timeLabel setText:[formatter stringFromDate:now]];
}


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil 
			   bundle:(NSBundle *)nibBundleOrNil {
    return [self init];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[timeLabel setText:@"???"];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	NSLog(@"Must have received a low memory warning.  Releaseing timeLabel");
    [super viewDidUnload];
	[timeLabel release];
	timeLabel = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[timeLabel release];
    [super dealloc];
}


@end
