//
//  MWCustomButton.m
//  Templates
//
//  Created by asaf vertz on 5/21/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWCustomButton.h"

@implementation MWCustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // Set the button Text Color
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    // Set default backgrond color
    [self setBackgroundColor:[UIColor blackColor]];
    
    // Add Custom Font
    [[self titleLabel] setFont:[UIFont fontWithName:@"Knewave" size:18.0f]];
    
    // Draw a custom gradient
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = self.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
                          (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
                          nil];
    [self.layer insertSublayer:btnGradient atIndex:0];
    
    // Round button corners
    CALayer *btnLayer = [self layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    
    // Apply a 1 pixel, black border around Buy Button
    [btnLayer setBorderWidth:1.0f];
    [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
}

@end
