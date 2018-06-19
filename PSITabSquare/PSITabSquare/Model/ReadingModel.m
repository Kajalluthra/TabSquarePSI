//
//  ReadingModel.m
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "ReadingModel.h"

@implementation ReadingModel
@synthesize O3EightHourMax,PsiTwentyFourHourly;


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    O3EightHourMax = [attributes valueForKeyPath:@"readings.o3_eight_hour_max"];
    PsiTwentyFourHourly = [attributes valueForKeyPath:@"readings.psi_twenty_four_hourly"];
    
    if ([O3EightHourMax isEqual:[NSNull null]]) {
        O3EightHourMax = nil;
    }
    
    if ([PsiTwentyFourHourly isEqual:[NSNull null]]) {
        PsiTwentyFourHourly = nil;
    }
    
    return self;
}


@end
