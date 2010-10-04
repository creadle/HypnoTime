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
	float xShift, yShift, rShift, gShift, bShift;

}

@property (nonatomic, assign) float xShift;
@property (nonatomic, assign) float yShift;
@property (nonatomic, assign) float rShift;
@property (nonatomic, assign) float gShift;
@property (nonatomic, assign) float bShift;

@end
