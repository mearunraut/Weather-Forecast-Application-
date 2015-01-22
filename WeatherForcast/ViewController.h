//
//  ViewController.h
//  WeatherForcast
//
//  Created by Arun Raut on 1/18/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *place;
- (IBAction)searchWeatherButton:(id)sender;


@end
