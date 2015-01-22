//
//  WeatherViewController.m
//  WeatherForcast
//
//  Created by Arun Raut on 1/20/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherListTableViewCell.h"
#import "ViewController.h"
#import "Weather.h"
#import "WeatherDetailViewController.h"
const double ZERO_CELSIUS_IN_KELVIN = 273.15;
double degreesKelvin;
double k;

@interface WeatherViewController ()

@end

@implementation WeatherViewController


- (void)viewDidLoad
{
     [super viewDidLoad];
     self.cityName.text=self.nameofCity;
    
    Weather *weatherReport=[[Weather alloc]init];
    
    weatherReport=[self.tempDetail objectAtIndex:0];
    
    NSLog(@"%@",weatherReport.weatherDescription);
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *weatherListIdentifier = @"WeatherListTableViewCell";
    WeatherListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:weatherListIdentifier];
   
    if (cell == nil) {
        cell = [[WeatherListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:weatherListIdentifier];
    }
   
    
    
    
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherDetailViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"WeatherDetailViewController"];
    destinationViewController.index= (int)indexPath.row;
    destinationViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:destinationViewController animated:YES completion:nil];
    
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}



- (IBAction)backtoHome:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)kelvinToCelsius:(id)sender {
    
    
    switch (self.selectType.selectedSegmentIndex)
    {
        case 0:
            
            
             k = degreesKelvin - ZERO_CELSIUS_IN_KELVIN;
            
            break;
        
        case 1:
            
             k = degreesKelvin;
            

            break;
        
        default:
            break;
    }

    
    
}
@end
