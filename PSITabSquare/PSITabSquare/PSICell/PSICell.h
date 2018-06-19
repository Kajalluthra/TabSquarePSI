//
//  PSICell.h
//  TabSquarePSI
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "ReadingModel.h"



@interface PSICell : UITableViewCell


@property (weak,nonatomic) IBOutlet UILabel * labelDirection;
@property (weak,nonatomic) IBOutlet UILabel * labelO3EightHourMax;
@property (weak,nonatomic) IBOutlet UILabel * labelPsiTwentyFourHourly;


-(void)slectedCellIndex:(DataModel *)DataDict selectedReading:(ReadingModel *)readingDict;




@end
