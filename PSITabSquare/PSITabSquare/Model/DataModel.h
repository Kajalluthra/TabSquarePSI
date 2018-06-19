//
//  DataModel.h
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataModel : NSObject {

   NSString *name;
}


@property (strong,nonatomic) NSString *name;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;


@end
