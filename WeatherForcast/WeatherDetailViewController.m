//
//  WeatherDetailViewController.m
//  WeatherForcast
//
//  Created by Arun Raut on 1/20/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()

@end

@implementation WeatherDetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%d",self.index);
}



- (IBAction)backtoWeatherListButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
