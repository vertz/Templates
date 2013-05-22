//
//  MWMainTableFooterView.h
//  
//
//  Created by asaf vertz on 12/13/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MWMainTableFooterViewDelegate <NSObject>

-(void)didPressMore;

@end

@interface MWMainTableFooterView : UIView
{
    
    
}

@property (nonatomic, weak) id <MWMainTableFooterViewDelegate> delegate;

- (IBAction)didPressAdd:(id)sender;

@end
