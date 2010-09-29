//
//  CurrentTimeViewController.h
//  HypnoTime
//
//  Created by Chris Readle (GMC-MSV-IT CONTRACTOR) on 9/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CurrentTimeViewController : UIViewController 
{
	IBOutlet UILabel *timeLabel;

}

- (IBAction)showCurrentTime:(id)sender;

@end
