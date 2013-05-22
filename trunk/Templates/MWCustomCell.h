//
//  MWCustomCell.h
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class MWCustomCell;

@protocol MWCustomCellDelegate <NSObject>

-(void)deleteCell:(MWCustomCell*)cell;

@end

@interface MWCustomCell : UITableViewCell
{
    
}

@property (nonatomic, weak) id <MWCustomCellDelegate> delegate;

@property (nonatomic, assign) NSUInteger row;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIImageView *tambler;

- (IBAction)didPressDelete:(id)sender;

-(void)prepareForUse:(BOOL)editing withRow:(NSUInteger)row andImageNamed:(NSString*)imageName;

@end
