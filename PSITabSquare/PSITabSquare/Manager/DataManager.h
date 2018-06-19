//
//  DataManager.h
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 20/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "DataModel.h"
#import "ReadingModel.h"
#import "LoadingView.h"
@protocol DataManagerDelegate;

@interface DataManager : NSObject

@property (nonatomic, strong) LoadingView *loadingScreen;
@property (nonatomic, strong) DataModel *dataModel;
@property (nonatomic, strong) ReadingModel *readingModel;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *readingArray;

@property (nonatomic, weak) id <DataManagerDelegate> delegate;

-(void)news_feed;

@end

@protocol DataManagerDelegate

- (void)dataLoadSuccess;
- (void)showError:(NSString*)errorStr;

@end
