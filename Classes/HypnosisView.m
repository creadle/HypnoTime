//
//  HypnosisView.m
//  Hypnossister
//
//  Created by Chris Readle (GMC-MSV-IT CONTRACTOR) on 9/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView
@synthesize xShift, yShift;


- (id)initWithFrame:(CGRect)frame 
{
	[super initWithFrame:frame];
	stripeColor = [[UIColor lightGrayColor] retain];
	
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	CGRect bounds = [self bounds];
	
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width / 2.0;
	center.y = bounds.origin.y + bounds.size.height / 2.0;
	
	float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, 10);
	
	[stripeColor setStroke];
	
	for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) 
	{
		center.x += xShift;
		center.y += yShift;
		CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
		CGContextStrokePath(context);
	}
	
	NSString *text = @"You are getting sleepy...";
	
	UIFont *font = [UIFont boldSystemFontOfSize:28];
	
	CGRect textRect;
	textRect.size = [text sizeWithFont:font];
	textRect.origin.x = center.x - textRect.size.width / 2.0;
	textRect.origin.y = center.y - textRect.size.height /2.0;
	
	[[UIColor blackColor] setFill];
	
	CGSize offset = CGSizeMake(4, -3);
	CGColorRef color = [[UIColor darkGrayColor] CGColor];
	CGContextSetShadowWithColor(context, offset, 2.0, color);
	
	[text drawInRect:textRect 
			withFont:font];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (motion == UIEventSubtypeMotionShake) {
		NSLog(@"Shake started");
		float r, g, b;
		r = arc4random() % 256 / 256.0;
		g = arc4random() % 256 / 256.0;
		b = arc4random() % 256 / 256.0;
		[stripeColor release];
		stripeColor = [UIColor colorWithRed:r
									  green:g
									   blue:b
									  alpha:1];
		[stripeColor retain];
		[self setNeedsDisplay];
	}
}

- (BOOL)canBecomeFirstResponder
{
	return YES;
}


- (void)dealloc {
	[stripeColor release];
    [super dealloc];
}


@end
