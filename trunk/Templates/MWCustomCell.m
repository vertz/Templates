//
//  MWCustomCell.m
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWCustomCell.h"

@implementation MWCustomCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)prepareForUse:(BOOL)editing withRow:(NSUInteger)row andImageNamed:(NSString*)imageName
{
    _row = row;
    [_deleteButton setHidden:!editing];
    
    UIImage* image = [UIImage imageNamed: imageName];
    if(image != nil)
    {
        [self.tambler setImage:image];
    }
    else
    {
        LogError(@"image (%@) is nil",imageName);
    }
    
    [[self titleLabel] setHidden:YES];
}

#pragma mark - action

- (IBAction)didPressDelete:(id)sender
{
    if (_delegate != nil)
    {
        [_delegate deleteCell: self];
    }
}

#pragma mark - UI

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // Set the button Text Color
    [[self titleLabel] setTextColor:[UIColor whiteColor]];
    [[self textLabel] setTextColor:[UIColor whiteColor]];
    
    // Add Custom Font
    [[self titleLabel] setFont:[UIFont fontWithName:@"leadcoat" size:18.0f]];
    [[self textLabel] setFont:[UIFont fontWithName:@"Knewave" size:16.0f]];
    
    // Draw a custom gradient
    CAGradientLayer *cellGradient = [CAGradientLayer layer];
    cellGradient.frame = self.bounds;
    cellGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:202.0f / 255.0f
                                               green:202.0f / 255.0f
                                                blue:202.0f / 255.0f
                                               alpha:1.0f] CGColor],
                          (id)[[UIColor colorWithRed:71.0f / 255.0f
                                               green:71.0f / 255.0f
                                                blue:71.0f / 255.0f
                                               alpha:1.0f] CGColor],
                          nil];
    [self.layer insertSublayer:cellGradient atIndex:0];
    
    // Round button corners
    CALayer *cellLayer = [self layer];
    [cellLayer setMasksToBounds:YES];
    [cellLayer setCornerRadius:5.0f];
    
    // Apply a 1 pixel, black border around Buy Button
    [cellLayer setBorderWidth:1.0f];
    [cellLayer setBorderColor:[[UIColor blackColor] CGColor]];
}

#pragma mark - fin

-(void)prepareForReuse
{
    [self.titleLabel setText:nil];
    [self.textLabel setText:nil];
    [self.tambler setImage:nil];
    [self setDelegate:nil];
    [self setRow:0];
}

@end
