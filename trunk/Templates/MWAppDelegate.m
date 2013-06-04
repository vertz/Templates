//
//  MWAppDelegate.m
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWAppDelegate.h"

#import <FacebookSDK/FacebookSDK.h>

#import "GAI.h"

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
    
    [FBProfilePictureView class];
    
    [self initGoogleAnalytics];
    
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
    // FBSample logic
    // We need to properly handle activation of the application with regards to SSO
    //  (e.g., returning from iOS 6.0 authorization dialog or from fast app switching).
    [FBAppCall handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // FBSample logic
    // if the app is going away, we close the session object
    [FBSession.activeSession close];
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

#pragma mark - GoogleAnalytics

-(void)initGoogleAnalytics
{
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set debug to YES for extra debugging information.
    [GAI sharedInstance].debug = NO;
    
    // Create tracker instance.
    id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-YOUR-TRACKING-ID"];
}

#pragma mark - facebook

// FBSample logic
// If we have a valid session at the time of openURL call, we handle Facebook transitions
// by passing the url argument to handleOpenURL; see the "Just Login" sample application for
// a more detailed discussion of handleOpenURL
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                    fallbackHandler:^(FBAppCall *call) {
                        Log(@"In fallback handler");
                    }];
}

@end
