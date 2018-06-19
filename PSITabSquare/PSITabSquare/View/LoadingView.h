//
//  LoadingView.h
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 20/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LoadingView : UIViewController

+ (id)sharedManager;

-(void)showLoading ;
-(void)hideLoading;

@end
