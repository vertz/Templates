//
//  ViewController.m
//  StylishUIButtonDemo
//
//  Created by Mark Hammonds on 8/7/12.
//  Copyright (c) 2012 Mobiletuts+. All rights reserved.
//

#import "MWLeftViewController.h"

@interface MWLeftViewController ()

@end

@implementation MWLeftViewController

@synthesize startGameButton, multiplayerButton, highScoresButton, creditsButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.trackedViewName = @"LeftView";
	
    _type = TemplateControllerTypeTable;
}

#pragma mark - buttons action

- (IBAction)didPressTableButton:(id)sender
{
    if(_type != TemplateControllerTypeTable)
    {
        _type = TemplateControllerTypeTable;
        
        MWAppDelegate* appDelegate = (MWAppDelegate*)[[UIApplication sharedApplication] delegate];
        
        self.sidePanelController.centerPanel = [appDelegate navigationController];
    }
    else
    {
        [self.sidePanelController showCenterPanelAnimated:YES];
        
    }
    
    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                      withAction:@"buttonPress"
                                                       withLabel:@"leftView/tableBtn"
                                                       withValue:[NSNumber numberWithInt:100]];
}

- (IBAction)didPressLove:(id)sender
{
    if(_type != TemplateControllerTypeSpreadLove)
    {
        _type = TemplateControllerTypeSpreadLove;
        
        self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:[[MWSpreadTheLoveViewController alloc] init]];
    }
    else
    {
        [self.sidePanelController showCenterPanelAnimated:YES];
        
    }
    
    [[[GAI sharedInstance] defaultTracker] sendEventWithCategory:@"uiAction"
                                                      withAction:@"buttonPress"
                                                       withLabel:@"leftView/loveBtn"
                                                       withValue:[NSNumber numberWithInt:100]];
}

#pragma mark - fin

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
