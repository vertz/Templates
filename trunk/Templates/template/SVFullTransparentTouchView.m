//
//  SVFullTransparentTouchView.m
//  StoresView
//
//  Created by Development on 6/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SVFullTransparentTouchView.h"


@implementation SVFullTransparentTouchView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //Log(@"Enter");
    // UIView will be "transparent" for touch events if we return NO
    return NO;
}

@end
