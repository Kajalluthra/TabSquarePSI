//
//  ViewController.m
//  TabSquarePSI
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "DataModel.h"
#import "PSICell.h"
#import "DataManager.h"

typedef void (^myCompletionBlock) (BOOL);

@interface ViewController () <DataManagerDelegate>{
    DataManager *dataManager;
    
    NSInteger selectedindex;
    UIRefreshControl *refreshControl;
    UIBarButtonItem *activityItem;
}

@end

@implementation ViewController
@synthesize readingTableView;

#pragma mark - App Lifecycle Method
- (void)viewDidLoad {
    
    [super viewDidLoad];

    selectedindex = -1;

    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor grayColor];
    [refreshControl addTarget:self action:@selector(requestApi) forControlEvents:UIControlEventValueChanged];
    [readingTableView addSubview:refreshControl];
    readingTableView.alwaysBounceVertical = YES;
    
    dataManager = [[DataManager alloc]init];
    dataManager.delegate = self;
    [self requestApi];

}

-(void)viewWillAppear:(BOOL)animated{
    activityItem = [[UIBarButtonItem alloc]initWithTitle:@"Activity log" style:UIBarButtonItemStylePlain target:self action:@selector(activityItemPressed)];
    self.navigationItem.rightBarButtonItem = activityItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PullToRefresh
-(void)requestApi{
    [dataManager news_feed];
}

#pragma mark - UITableviewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataManager.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"Cell";
    
    PSICell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    [cell slectedCellIndex:[dataManager.dataArray objectAtIndex:indexPath.row] selectedReading:[dataManager.readingArray objectAtIndex:0]];
    
    return cell;
}

#pragma mark - IBAction
-(void)activityItemPressed{
    [self performSegueWithIdentifier:@"log" sender:self];
}


#pragma mark - Protocol
- (void)dataLoadSuccess {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.readingTableView reloadData];
    });
    
    if ([refreshControl isRefreshing]) {
        [refreshControl endRefreshing];
    }
}

- (void)showError:(NSString*)errorStr {
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Alert"
                                 message:errorStr
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Try Again"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                              
                                    [self requestApi];
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"Cancel"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   
                               }];
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end

