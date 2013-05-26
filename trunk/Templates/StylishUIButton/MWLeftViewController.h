//
//  ViewController.h
//  StylishUIButtonDemo
//
//  Created by Mark Hammonds on 8/7/12.
//  Copyright (c) 2012 Mobiletuts+. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "GAI.h"
#import "GAITrackedViewController.h"

#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

#import "MWCustomButton.h"

#import "MWAppDelegate.h"
#import "MWConstants.h"

# import "MWSpreadTheLoveViewController.h"

@interface MWLeftViewController : GAITrackedViewController
{
    TemplateControllerType _type;
}

@property(nonatomic, strong) IBOutlet MWCustomButton *startGameButton;
@property(nonatomic, strong) IBOutlet MWCustomButton *multiplayerButton;
@property(nonatomic, strong) IBOutlet MWCustomButton *highScoresButton;
@property(nonatomic, strong) IBOutlet MWCustomButton *creditsButton;

- (IBAction)didPressTableButton:(id)sender;
- (IBAction)didPressLove:(id)sender;


@end
