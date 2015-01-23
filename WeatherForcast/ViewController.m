//
//  ViewController.m
//  WeatherForcast
//
//  Created by Arun Raut on 1/18/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Weather.h"
#import "WeatherViewController.h"
@interface ViewController ()
@property NSString *longitude;
@property NSString *latitude;
@property NSString *myPlace;
@property NSDictionary *dictionary;
@property NSDictionary *list;
@property NSDictionary *temp;
@property NSDictionary *weather;
@property NSDictionary *city;
@property NSMutableArray *daysArray;

@end

@implementation ViewController
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    geocoder = [[CLGeocoder alloc] init];
    
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [errorAlert show];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.longitude=[@"Longitude : " stringByAppendingString:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]];
        
        self.latitude=[@"Latitude : " stringByAppendingString:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]];
    }
    [locationManager stopUpdatingLocation];
    
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.myPlace = [NSString stringWithFormat:@"%@",
                            placemark.locality];
            // NSLog(@"%@",self.myPlace);
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
}


- (IBAction)searchWeatherButton:(id)sender {
    
    
    NSString *stringId=[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=14&APPID=91297f6aef90ada330bfff773671a4ba",self.place.text];
    
    NSURL *url=[NSURL URLWithString:stringId];
    NSURLRequest *urlrequest=[NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:urlrequest];
    operation.responseSerializer=[AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        self.city=[responseObject valueForKey:@"city"];
        
        self.daysArray=[[NSMutableArray alloc]init];
        self.list=[responseObject valueForKey:@"list"];
       
        
       
        for(int i=0;i<[self.list count];i++){
            Weather *day=[[Weather alloc] init];
            
           
            self.weather=[[self.list valueForKey:@"weather"] objectAtIndex:0];
            
            
            
            self.temp=[self.list valueForKey:@"temp"];
            
            
            day.weatherDescription=[[self.weather valueForKey:@"description"] objectAtIndex:0];
            day.main=   [[self.weather valueForKey:@"main"]objectAtIndex:0];
            
            day.maxTemp = [[self.temp valueForKey:@"max"] objectAtIndex:i];
            day.cloudiNess=[[self.list valueForKey:@"clouds"]objectAtIndex:0];
            day.pressureLabel=[[self.list valueForKey:@"pressure"]objectAtIndex:i];
            day.humidityLabel=[[self.list valueForKey:@"humidity"]objectAtIndex:i];
            day.windLabel=[[self.list valueForKey:@"speed"]objectAtIndex:i];
            
            [self.daysArray addObject:day];
            
        }
        
        
        
        WeatherViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"WeatherViewController"];
        destinationViewController.nameofCity=[self.city valueForKey:@"name"];
        destinationViewController.tempDetail=self.daysArray;
        destinationViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:destinationViewController animated:YES completion:nil];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    [operation start];
    
}
@end
