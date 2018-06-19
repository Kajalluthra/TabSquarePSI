//
//  ReadingModel.h
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadingModel : NSObject {
    
    NSDictionary *O3EightHourMax;
    NSDictionary *PsiTwentyFourHourly;
}

@property (strong,nonatomic)  NSDictionary *O3EightHourMax;
@property (strong,nonatomic)  NSDictionary *PsiTwentyFourHourly;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
