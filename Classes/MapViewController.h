//
//  MapViewController.h
//  HypnoTime
//
//  Created by Chris Readle (GMC-MSV-IT CONTRACTOR) on 9/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
	CLLocationManager *locationManager;
	
	IBOutlet MKMapView *mapView;	

}

@end
