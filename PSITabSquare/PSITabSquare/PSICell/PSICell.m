//
//  PSICell.m
//  TabSquarePSI
//
//  Created by Gaganpreet  Singh on 19/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

#import "PSICell.h"


@implementation PSICell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)slectedCellIndex:(DataModel *)DataDict selectedReading:(ReadingModel *)readingDict {
    
    _labelDirection.text = [NSString stringWithFormat:@"%@",DataDict.name];
    _labelO3EightHourMax.text = [NSString stringWithFormat:@"O3_Eight_Hour_Max: %@",[readingDict.O3EightHourMax objectForKey:DataDict.name]];
    _labelPsiTwentyFourHourly.text = [NSString stringWithFormat:@"Psi_Twenty_Four_Hourly: %@",[readingDict.PsiTwentyFourHourly objectForKey:DataDict.name]];
    
}

@end
