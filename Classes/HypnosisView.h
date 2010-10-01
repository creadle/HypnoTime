//
//  HypnosisView.h
//  Hypnossister
//
//  Created by Chris Readle (GMC-MSV-IT CONTRACTOR) on 9/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HypnosisView : UIView {
	
	UIColor *stripeColor;	
	float xShift, yShift;

}

@property (nonatomic, assign) float xShift;
@property (nonatomic, assign) float yShift;

@end
