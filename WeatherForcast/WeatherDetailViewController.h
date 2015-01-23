//
//  WeatherDetailViewController.h
//  WeatherForcast
//
//  Created by Arun Raut on 1/20/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"
@interface WeatherDetailViewController : UIViewController
- (IBAction)backtoWeatherListButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *dateofWeather;
@property int index;
@property NSMutableArray* weatherDetail;
@property NSString *nameofCity;
@property (weak, nonatomic) IBOutlet UILabel *maxTemp;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *cloudiNess;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunriseTime;

@end
