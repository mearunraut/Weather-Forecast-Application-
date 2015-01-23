//
//  Weather.h
//  WeatherForcast
//
//  Created by Arun Raut on 1/18/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property NSString *weatherDescription;
@property NSNumber *maxTemp;
@property NSString *main;

@property NSNumber *windLabel;
@property NSString *cloudiNess;
@property NSNumber *pressureLabel;
@property NSNumber *humidityLabel;
@property NSString *sunriseTime;


@end
