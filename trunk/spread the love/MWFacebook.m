//
//  SessionFacebook.m
//  UPad
//
//  Created by Ehud Epstein on 11/6/12.
//  Copyright (c) 2012 com.mobiwedo.upad. All rights reserved.
//

#import "MWFacebook.h"
#import <FacebookSDK/FacebookSDK.h>

#import <Accounts/Accounts.h>

@implementation MWFacebook{
}

-(id)init {
	self = [super init];
	if (self != nil) {
        
        _description = nil;
        _shouldPostSilently = YES;
    }
	return self;
}

-(BOOL)postOnIOS6{
    
    
    mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
    mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook]; //Tell him with what social plattform to use it, e.g. facebook or twitter
    [mySLComposerSheet setInitialText:self.name]; //the message you want to post
    if (self.image){
        [mySLComposerSheet addImage:self.image]; //an image you could post
    }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                [[NSNotificationCenter defaultCenter] postNotificationName:facebookPostedWithFailure object:nil userInfo:nil];
                break;
            case SLComposeViewControllerResultDone:
                [[NSNotificationCenter defaultCenter] postNotificationName:facebookPostedSuccessfully object:nil userInfo:nil];
                break;
            default:
                break;
        }
    }];
    
    [super.parentController presentViewController:mySLComposerSheet animated:YES completion:nil];
    
    return YES;
}

- (void)postWithAllowLogin:(BOOL)allowLogin {
    LogEnter();
    
    //name
    if(!self.name){
        self.name = NSLocalizedString(@"TMSocialPostingText", @"");
    }
    
    //link
    if (!self.link){
        self.link = @"";
    }
    
    if (!self.imageURL){
        self.imageURL = kDefaultImageURL;
        
    }
    
    //    if (NSClassFromString(@"SLComposeViewController") && !_shouldPostSilently && [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
    //        [self postOnIOS6];
    //    }
    //    else{
    [self openSessionWithAllowLoginUI:allowLogin];
    //    }
    
    
}

- (void)post:(FBSession *)session{
    NSMutableDictionary *postparams = [[NSMutableDictionary alloc] init];
    [delegate shareWillStart];
    
    if (!self.userMessage) { //TODO: make this normal
        self.userMessage = @"";
    } else {
        [postparams setObject:self.userMessage forKey:@"description"];
        [postparams setObject:self.link forKey:@"link"];
        
        
        [FBWebDialogs presentFeedDialogModallyWithSession:session parameters:postparams handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
            NSLog(@"abc");
        } ];
    }
    
    if (self.image) {
        [postparams setObject:UIImagePNGRepresentation(self.image) forKey:@"picture"];
        
        [FBRequestConnection startWithGraphPath:@"me/photos"
                                     parameters:postparams
                                     HTTPMethod:@"POST"
                              completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                  if (error) {
                                      LogErrorObject(error);
                                      [self performSelectorOnMainThread:@selector(finish:) withObject:[NSNumber numberWithBool:NO] waitUntilDone:YES];
                                  } else {
                                      [self performSelectorOnMainThread:@selector(finish:) withObject:[NSNumber numberWithBool:YES] waitUntilDone:YES];
                                  }
                              }];
    }
}


- (void)postToFacebookMessage:(NSString *)message andImage:(UIImage *)image{
    LogEnter();
    self.image = image;
    //    [self postToFacebookMessage:message];
    //
    //    NSMutableDictionary *postparams = [[NSMutableDictionary alloc] init];
    //
    //    if(!message){
    //        message = @"Tranzmate!";
    //    }
    //
    //    [postparams setObject:message forKey:@"description"];
    //
    //    if(!image){
    //        image = [UIImage imageNamed:@"Moovit_logo_about.png"];
    //    }
    //
    //    NSString* link = [NSString stringWithFormat:@"http://moovitapp.com/%@", [[TMLocalizationSystem sharedLocalSystem] currentLanguage].code];
    //    [postparams setObject:link forKey:@"link"];
    //
    //    [postparams setObject:UIImagePNGRepresentation(image) forKey:@"source"];
    //
    //    [FBRequestConnection startWithGraphPath:@"me/photos" parameters:postparams HTTPMethod:@"POST" completionHandler:^(FBRequestConnection *connection,
    //                         id result,
    //                         NSError *error) {
    //         NSString *alertText;
    //         if (error) {
    //             LogError(@"error: domain = %@, code = %d",
    //                      error.domain, error.code);
    //
    //             alertText = [NSString stringWithFormat:
    //                          @"error: domain = %@, code = %d",
    //                          error.domain, error.code];
    //         } else {
    //             alertText = @"Posted successfully";
    //         }
    //         // Show the result in an alert
    //         [[[UIAlertView alloc] initWithTitle:@"Post" message:alertText delegate:self cancelButtonTitle:@"OK!" otherButtonTitles:nil] show];
    //
    //     }];
    
}


- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI {
    LogEnter();
    
   BOOL basicFacebookPermissionsSet = [[NSUserDefaults standardUserDefaults] boolForKey:@"basicFacebookPermissionsSet"];
    
    if (!basicFacebookPermissionsSet){
        NSArray *permissions = [NSArray arrayWithObjects:
                                //                            @"user_photos",
                                //                            @"user_videos",
                                //                            @"user_checkins",
                                //                            @"friends_checkins",
                                //                            @"user_location",
                                                            @"email",
                                //                            @"read_stream",
                                //                            @"user_birthday",
                                //                            @"user_likes",
                                //                            @"user_about_me",
                                //@"publish_stream",
                                //                            @"offline_access",
                                // @"publish_actions",
                                nil];
        
        return [FBSession openActiveSessionWithReadPermissions:permissions allowLoginUI:allowLoginUI completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"basicFacebookPermissionsSet"];
            [self openSessionWithAllowLoginUI:allowLoginUI];
        }];

    }
    else{
        NSArray *permissions = [NSArray arrayWithObjects:
    //                            @"user_photos",
    //                            @"user_videos",
    //                            @"user_checkins",
    //                            @"friends_checkins",
    //                            @"user_location",
    //                            @"email",
    //                            @"read_stream",
    //                            @"user_birthday",
    //                            @"user_likes",
    //                            @"user_about_me",
                                @"publish_stream",
    //                            @"offline_access",
                                @"publish_actions",
                                nil];
        
        return [FBSession openActiveSessionWithPublishPermissions:permissions defaultAudience:FBSessionDefaultAudienceEveryone allowLoginUI:allowLoginUI completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
            [self sessionStateChanged:session state:state error:error];
        }];
    }
}


- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState)state
                      error:(NSError *)error
{
    LogEnter();
    
    if (error){
        LogErrorObject(error);
        NSDictionary* userInfo = [NSDictionary dictionaryWithObject:error forKey:@"error"];
        [[NSNotificationCenter defaultCenter] postNotificationName:facebookPostedWithFailure object:nil userInfo:userInfo];
    }
    
    switch (state) {
        case FBSessionStateOpen: {
            
            // FBSample logic
            // Pre-fetch and cache the friends for the friend picker as soon as possible to improve
            // responsiveness when the user tags their friends.
            //            FBCacheDescriptor *cacheDescriptor = [FBFriendPickerViewController cacheDescriptor];
            //            [cacheDescriptor prefetchAndCacheForSession:session];
            
            Log(@"Facebook session open");
            [[NSNotificationCenter defaultCenter] postNotificationName:facebookLoginNotification object:nil userInfo:nil];
            
            [self post:session];
//            [self likePage];
            //Get user details
            //            [[FBRequest requestForMe] startWithCompletionHandler:
            //             ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
            //                 if (!error) {
            //
            //                 }
            //                 else{
            //                     Log(@"%@",error);
            //                 }
            //             }];
            
            
        }
            break;
        case FBSessionStateClosed:
            Log(@"Facebook session closed");
            break;
        case FBSessionStateClosedLoginFailed: {
            [[NSNotificationCenter defaultCenter] postNotificationName:facebookLogoutNotification object:nil userInfo:nil];
        }
            break;
        default:
            break;
    }
    
    if (error) {
        LogError(@"Facebook error: %@", error.localizedDescription);
        
    }
}


/* this method makes like to the slide.ly site */
/*
- (void)likePage {
    NSMutableDictionary<FBGraphObject> *action = [FBGraphObject graphObject];
    action[@"object"] = @"http://slide.ly/";
    
    [FBRequestConnection startForPostWithGraphPath:@"me/og.likes"
                                       graphObject:action
                                 completionHandler:^(FBRequestConnection *connection,
                                                     id result,
                                                     NSError *error) {
                                 }];
}
*/
 
@end
