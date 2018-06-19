//
//  DataManager.m
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 20/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "DataManager.h"
#import "DataModel.h"
#import "ReadingModel.h"
#import "LoadingView.h"

@implementation DataManager
@synthesize dataArray, dataModel, readingModel, readingArray;

- (instancetype)init
{
    self = [super init];
    if (self) {        
        self.dataModel = [[DataModel alloc]init];
    }
    return self;
}

-(void)news_feed{
    
    [[LoadingView sharedManager] showLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *parameter=[[NSMutableDictionary alloc] init];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *urlString=[NSString stringWithFormat:@"https://api.data.gov.sg/v1/environment/psi"];
    
    [manager GET:urlString
      parameters:parameter
         success:^(AFHTTPRequestOperation *operation, id responseObject){
             NSError *error1=[[NSError alloc] init];
             NSString *theStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             
             NSDictionary * response =
             [NSJSONSerialization JSONObjectWithData:[theStr dataUsingEncoding:NSUTF8StringEncoding]
                                             options: NSJSONReadingMutableContainers
                                               error:&error1];
             //success
             self.dataArray = [[NSMutableArray alloc] init];
             self.readingArray = [[NSMutableArray alloc] init];
             
             NSArray *array = [response objectForKey:@"region_metadata"];
             for (NSDictionary *selecteditem in array) {
                 
                 dataModel = [[DataModel alloc] initWithAttributes:selecteditem];
                 [dataArray addObject:dataModel];
             }
             
             NSArray *readArray = [response objectForKey:@"items"];
             for (NSDictionary *selecteditem in readArray) {
                 
                 self.readingModel = [[ReadingModel alloc] initWithAttributes:selecteditem];
                 [readingArray addObject:self.readingModel];
             }
             
             [[LoadingView sharedManager] hideLoading];
             [self.delegate dataLoadSuccess];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
            
             [[LoadingView sharedManager] hideLoading];
             [self.delegate showError:error.localizedDescription];

         }];
}

@end
