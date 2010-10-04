//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Chris Readle (GMC-MSV-IT CONTRACTOR) on 9/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"


@implementation HypnosisViewController

- (id)init
{
	[super initWithNibName:nil
					bundle:nil];
	
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:@"Hypnosis"];
	
	UIImage *image = [UIImage imageNamed:@"Hypno.png"];
	[tbi setImage:image];
	
	return self;
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
	return [self init];
}

- (void)loadView
{
	HypnosisView *hv = [[HypnosisView alloc] initWithFrame:CGRectZero];
	[hv setBackgroundColor:[UIColor whiteColor]];
	[self setView:hv];
	[hv	release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	NSLog(@"Monitoring accelerometer");
	UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
	[a setUpdateInterval:0.1];
	[a setDelegate:self];
	
	[[self view] becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

- (void)accelerometer:(UIAccelerometer *)meter
		didAccelerate:(UIAcceleration *)accel
{
	//NSLog(@"%f, %f, %f", [accel x], [accel y], [accel z]);
	HypnosisView *hv = (HypnosisView *)[self view];
	float xShift = [hv xShift] * 0.8 + [accel x] * 2.0;
	float yShift = [hv yShift] * 0.8 - [accel y] * 2.0;
	
	float rShift, gShift, bShift;
	rShift = gShift = bShift = 0;
	if ([accel x] >= 0.5) {
		rShift = [accel x];
	}
	else if([accel x] < 0.5){
		rShift = fabs([accel x]);
		if (rShift >= 0.5) {
			rShift -= 0.5;
		}
	}
	if ([accel y] >= 0.5) {
		gShift = [accel y];
	}
	else if([accel y] < 0.5){
		gShift = fabs([accel y]);
		if (gShift >= 0.5) {
			gShift -= 0.5;
		}
	}
	if ([accel z] >= 0.5) {
		bShift = [accel z];
	}
	else if([accel z] < 0.5){
		bShift = fabs([accel z]);
		if (bShift >= 0.5) {
			bShift -= 0.5;
		}
	}

	[hv setRShift:rShift];
	[hv setGShift:gShift];
	[hv setBShift:bShift];
	[hv setXShift:xShift];
	[hv setYShift:yShift];
	
	[hv setNeedsDisplay];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
