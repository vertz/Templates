//
//  MWAppDelegate.m
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWAppDelegate.h"

#import "UIColor+MW.h"
#import "MWConstants.h"
#import "MWDataSingleton.h"
#import "MWTableViewController.h"

#import "JASidePanelController.h"
#import "MWLeftViewController.h"

#import "MWASIGetExample.h"

@implementation MWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
    if(getenv("NSZombieEnabled") || getenv("NSAutoreleaseFreedObjectCheckEnabled"))
    {
        Log(@"NSZombieEnabled/NSAutoreleaseFreedObjectCheckEnabled enabled!");
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.viewController = [[JASidePanelController alloc] init];
    self.viewController.shouldDelegateAutorotateToVisiblePanel = NO;
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:[[MWTableViewController alloc] init]];
    
    self.viewController.leftPanel = [[MWLeftViewController alloc] init];
	self.viewController.centerPanel = self.navigationController;
    
    [self.viewController setAllowRightSwipe:NO];
    
    [self loadNavigationBar];
	
	self.window.rootViewController = self.viewController;
    
    [self.window makeKeyAndVisible];
    
    /////
    
    _dataSingleton = [MWDataSingleton sharedInstance];
    [_dataSingleton initData];
    
    ////
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

#pragma mark - UI

-(void)loadNavigationBar
{
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"Vuboo_Matches_NavBar.png"]forBarMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance]
     setBackButtonBackgroundImage:[[UIImage imageNamed:@"Vuboo_General_Butt_NavBar_Back_Reg.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0,20,0,10)]
     forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance]
     setBackButtonBackgroundImage:[[UIImage imageNamed:@"Vuboo_General_Butt_NavBar_Back_Pressed.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(0,20,0,10)]
     forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"NeoSansIntel" size:13], UITextAttributeFont,[UIColor colorWithHex: 0xffffff],UITextAttributeTextColor,nil] forState:UIControlStateNormal];
}

@end
