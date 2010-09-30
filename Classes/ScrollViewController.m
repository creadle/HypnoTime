    //
//  ScrollViewController.m
//  HypnoTime
//
//  Created by Chris Readle (GMC-MSV-IT CONTRACTOR) on 9/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ScrollViewController.h"

@implementation ScrollViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView 
{
	CGRect frame = [[UIScreen mainScreen] applicationFrame];
	UIScrollView *sv = [[[UIScrollView alloc] initWithFrame:frame] autorelease];
	
	UIViewController *hypnoVC = [[HypnosisViewController alloc] init];
	UIViewController *timeVC = [[CurrentTimeViewController alloc] init];
	//UIViewController *mapVC = [[MapViewController alloc] init];
	
	frame.origin.y = 0;
	[[hypnoVC view] setFrame:frame];
	
	frame.origin.x += frame.size.width;
	[[timeVC view] setFrame:frame];
	
	//frame.origin.x += frame.size.width;
	//[[mapVC view] setFrame:frame];
	
	[sv addSubview:[hypnoVC view]];
	[sv addSubview:[timeVC view]];
	//[sv addSubview:[mapVC view]];
	
	[sv setContentSize:CGSizeMake(3 * frame.size.width, frame.size.height)];
	[sv setPagingEnabled:YES];
	[self setView:sv];
	
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
