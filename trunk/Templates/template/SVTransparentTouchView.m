//
//  SVTransparentTouchView.m
//  StoresView
//
//  Created by Development on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SVTransparentTouchView.h"


@implementation SVTransparentTouchView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // UIView will be "transparent" for touch events if we return NO
    switch (_transparencyType) {
        case SVTransparencyTypeContent:
            for(UIView* subview in self.subviews){
                CGPoint p = [subview convertPoint:point fromView:self];
                if([subview pointInside:p withEvent:event]){
                    return YES;
                }
            }
            return NO;
            break;
        case SVTransparencyTypeVisibleContent:
            for(UIView* subview in self.subviews){
                if((subview.alpha > 0.0) && (subview.hidden == NO)){
                    CGPoint p = [subview convertPoint:point fromView:self];
                    if([subview pointInside:p withEvent:event]){
                        return YES;
                    }
                }
            }
            return NO;
            break;
        case SVTransparencyTypeFull:
            return NO;
            break;
        default:
            return YES;
            break;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_transparencyType == SVTransparencyTypeTransfer){
        [self.nextResponder touchesBegan:touches withEvent:event];
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_transparencyType == SVTransparencyTypeTransfer){
        [self.nextResponder touchesCancelled:touches withEvent:event];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_transparencyType == SVTransparencyTypeTransfer){
        [self.nextResponder touchesEnded:touches withEvent:event];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if(_transparencyType == SVTransparencyTypeTransfer){
        [self.nextResponder touchesMoved:touches withEvent:event];
    }
}

@end
