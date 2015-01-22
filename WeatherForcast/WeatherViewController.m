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
//273.15;


@interface WeatherViewController ()

@end

@implementation WeatherViewController


- (void)viewDidLoad
{
     [super viewDidLoad];
     self.cityName.text=self.nameofCity;
    
    
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
    
    
    if(self.selectType.selectedSegmentIndex==0){
    Weather *weatherReport=[[Weather alloc]init];
    
    weatherReport=[self.tempDetail objectAtIndex:indexPath.row];
    
    cell.weatherCondition.text= weatherReport.weatherDescription ;
    
    cell.daytype.text= weatherReport.main;
    
    cell.maxTemp.text= [NSString stringWithFormat:@"%d", [weatherReport.maxTemp intValue]];
    }else{
    
        Weather *weatherReport=[[Weather alloc]init];
        
        weatherReport=[self.tempDetail objectAtIndex:indexPath.row];
        
        cell.weatherCondition.text= weatherReport.weatherDescription ;
        
        cell.daytype.text= weatherReport.main;
        
        cell.maxTemp.text= [NSString stringWithFormat:@"%d", [weatherReport.maxTemp intValue]-273];
    
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
            
            [self.weatherListTable reloadData];
            
            break;
        
        case 1:
            
            [self.weatherListTable reloadData];
            break;
        
        default:
            break;
    }

    
    
}
@end
