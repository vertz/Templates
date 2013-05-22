//
//  SVTransparentTouchView.h
//  StoresView
//
//  Created by Development on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    SVTransparencyTypeNone = 0,         //act like usual uiview
    SVTransparencyTypeContent,          //only content get touches
    SVTransparencyTypeVisibleContent,   //only visible (e.g. alpha > 0.0 and hidden = NO) content get touches
    SVTransparencyTypeFull,             //fully transparent for touches
    SVTransparencyTypeTransfer          //take the touch but also transfer it to the next responder
}SVTransparencyType;

@interface SVTransparentTouchView : UIView {
    SVTransparencyType      _transparencyType;
    id                      _target;
    SEL                     _selector;
}

@property(nonatomic,assign)SVTransparencyType transparencyType;


@end
