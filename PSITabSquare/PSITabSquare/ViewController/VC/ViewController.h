//
//  ViewController.h
//  PSITabSquare
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) IBOutlet UITableView * readingTableView;

@end
