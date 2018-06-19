//
//  LoadingView.m
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 20/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView() {
    UIActivityIndicatorView *spinner ;
    UIWindow* window;
}

@end

@implementation LoadingView

+ (id)sharedManager {
    static LoadingView *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


-(void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)showLoading {
    window = [UIApplication sharedApplication].keyWindow;
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.tintColor = [UIColor blueColor ];
    spinner.backgroundColor = [UIColor lightGrayColor ];
    spinner.alpha = 0.7;
    spinner.frame = self.view.bounds;

    [spinner startAnimating];
    
    
    [window addSubview:spinner];
}


-(void)hideLoading {
    [spinner removeFromSuperview];
}

@end
