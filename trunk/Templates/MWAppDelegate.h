//
//  MWAppDelegate.h
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MWASIGetExample;
@class MWDataSingleton;
@class JASidePanelController;

@interface MWAppDelegate : UIResponder <UIApplicationDelegate>
{
    MWASIGetExample* _asi;
    
    MWDataSingleton* _dataSingleton;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController* navigationController;

@property (strong, nonatomic) JASidePanelController *viewController;

@end
