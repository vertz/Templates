//
//  SpreadCell.h
//  Slide.ly
//
//  Created by Yuri Fatahov on 4/21/13.
//  Copyright (c) 2013 EasiHi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWConstants.h"

@interface SpreadCell : UITableViewCell
{
    MWSlidelySpreadType _spreadType;
}


@property (weak, nonatomic) IBOutlet UIImageView *spreadIcon;
@property (weak, nonatomic) IBOutlet UILabel *spreadLabel;

-(void) initSpreadCell: (MWSlidelySpreadType) spreadType;

@end
