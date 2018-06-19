//
//  DataModel.m
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
@synthesize name;


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    name = [attributes valueForKey:@"name"];
    
    if ([name isEqual:[NSNull null]]) {
         name = nil;
    }
    
    return self;
}


@end
