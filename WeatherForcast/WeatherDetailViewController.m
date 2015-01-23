//
//  WeatherDetailViewController.m
//  WeatherForcast
//
//  Created by Arun Raut on 1/20/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import "WeatherDetailViewController.h"
#import "Weather.h"
extern BOOL isKelvin;
@interface WeatherDetailViewController ()

@end

@implementation WeatherDetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    Weather *weatherReport=[[Weather alloc]init];
    
    
        weatherReport=[self.weatherDetail objectAtIndex:self.index];
        self.dateofWeather.text=[NSString stringWithFormat:@"%d", self.index+1];
        self.sunriseTime.text=weatherReport.weatherDescription;
        self.cityName.text=self.nameofCity;
        self.windLabel.text=[NSString stringWithFormat:@"%f", [weatherReport.windLabel doubleValue]];
       self.cloudiNess.text=[NSString stringWithFormat:@"%f", [weatherReport.cloudiNess doubleValue]];
       self.pressureLabel.text=[NSString stringWithFormat:@"%f", [weatherReport.pressureLabel doubleValue]];
        self.humidityLabel.text=[NSString stringWithFormat:@"%f", [weatherReport.humidityLabel doubleValue]];
       if(isKelvin==YES)
        self.maxTemp.text=[NSString stringWithFormat:@"%d", [weatherReport.maxTemp intValue]];
     else
         self.maxTemp.text=[NSString stringWithFormat:@"%d", [weatherReport.maxTemp intValue]-273];
  }



- (IBAction)backtoWeatherListButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
