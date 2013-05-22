//
//  MWMainTableFooterView.m
//  
//
//  Created by asaf vertz on 12/13/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import "MWMainTableFooterView.h"

@implementation MWMainTableFooterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (IBAction)didPressAdd:(id)sender
{
    Log();
    
    if (_delegate != nil)
    {
        [_delegate didPressMore];
    }
}
@end
