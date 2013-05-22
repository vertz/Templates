//
//  SpreadCell.m
//  Slide.ly
//
//  Created by Yuri Fatahov on 4/21/13.
//  Copyright (c) 2013 EasiHi. All rights reserved.
//

#import "SpreadCell.h"

@implementation SpreadCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void) initSpreadCell: (MWSlidelySpreadType) spreadType
{
    _spreadType = spreadType;
    
    //self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (spreadType) {
        case MWSlidelySpreadTypeEmail:
            _spreadIcon.image = [UIImage imageNamed: @"Spread_email.png"];
            _spreadLabel.text = NSLocalizedString(@"EZEmailAFriend",@"Email a friend");
            break;            
        case MWSlidelySpreadTypeFBShare:
            _spreadIcon.image = [UIImage imageNamed: @"Spread_facebook.png"];
            _spreadLabel.text = NSLocalizedString(@"EZShareOnFacebook",@"Share on Facebook");
            break;
        case MWSlidelySpreadTypeTwitterShare:
            _spreadIcon.image = [UIImage imageNamed: @"Spread_twitter.png"];
            _spreadLabel.text = NSLocalizedString(@"EZShareOnTwitter",@"Share on Twitter");
            break;
        case MWSlidelySpreadTypeFBLike:
            _spreadIcon.image = [UIImage imageNamed: @"Spread_facebook_like.png"];
            _spreadLabel.text = NSLocalizedString(@"EZLikeOurPage",@"Like our page");
            break;
        case MWSlidelySpreadTypeTwitterFollow:
            _spreadIcon.image = [UIImage imageNamed: @"Spread_twitter.png"];
            _spreadLabel.text = NSLocalizedString(@"EZFollowUsOnTwitter",@"Follow us on Twitter");
            break;
        case MWSlidelySpreadTypeRateUs:
            _spreadIcon.image = [UIImage imageNamed: @"Spread_rate.png"];
            _spreadLabel.text = NSLocalizedString(@"EZRateUsOnTheAppstore",@"Rate us on the Appstore");
            break;
        default:
            break;
    }
}

- (IBAction)didSpreadArrowPressed:(id)sender {
    
}

@end