//
//  Constant.m
//  WeatherForcast
//
//  Created by Arun Raut on 1/18/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import "Constant.h"

static NSString* jsonUrl=@"http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=14&mode=json";
static NSString* appId=@"91297f6aef90ada330bfff773671a4ba";
@implementation Constant

+(NSString*)jsonID{
    
    return jsonUrl;
    
}
+(NSString*)appID{
    
    return appId;
    
}
+ (double)kelvinToCelsius:(double)degreesKelvin
{
    const double ZERO_CELSIUS_IN_KELVIN = 273.15;
    return degreesKelvin - ZERO_CELSIUS_IN_KELVIN;
}
@end
