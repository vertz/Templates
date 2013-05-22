//
//  TMTwitter.m
//  TranzMate
//
//  Created by Vadim Fainshtein on 12/4/12.
//  Copyright (c) 2012 TranzMate. All rights reserved.
//

#import "MWTwitter.h"

#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>


@implementation MWTwitter


-(id)initWithViewController:(UIViewController*)viewController {
    
    if (self = [super init]){
        super.parentController = viewController;
        self.image = [UIImage imageNamed:@""];
    }
    
    return self;
}

-(void)postWithAllowLogin:(BOOL)allowLogin {
    
}


- (void)postImageFromViewController:(UIViewController *)viewController {
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *twitterType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    TWRequestHandler requestHandler =
    ^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        if (responseData) {
            NSInteger statusCode = urlResponse.statusCode;
            if (statusCode >= 200 && statusCode < 300) {
                /*
                NSDictionary *postResponseData =
                [NSJSONSerialization JSONObjectWithData:responseData
                                                options:NSJSONReadingMutableContainers
                                                  error:NULL];
                 */
                [self performSelectorOnMainThread:@selector(finish:) withObject:@(YES) waitUntilDone:YES];
            } else {
                [self performSelectorOnMainThread:@selector(finish:) withObject:@(NO) waitUntilDone:YES];
            }
        } else {
                [self performSelectorOnMainThread:@selector(finish:) withObject:@(NO) waitUntilDone:YES];
        }};
    
    ACAccountStoreRequestAccessCompletionHandler accountStoreHandler =
    ^(BOOL granted, NSError *error) {
        if (granted) {
            NSArray *accounts = [accountStore accountsWithAccountType:twitterType];
            
            /* for posting images */
            NSURL *url = [NSURL URLWithString:@"https://api.twitter.com"
                          @"/1.1/statuses/update_with_media.json"];
            
            NSDictionary *params = @{@"status" : @""};
            TWRequest *request = [[TWRequest alloc] initWithURL:url
                                                     parameters:params
                                                  requestMethod:TWRequestMethodPOST];
            if (self.image != nil) {
                NSData *imageData = UIImagePNGRepresentation(self.image);
                [request addMultiPartData:imageData
                                 withName:@"media[]"
                                     type:@"image/jpeg"];
            }
            
            [request setAccount:[accounts lastObject]];
            //the handler does not run on the main thread
            [(id)delegate performSelectorOnMainThread:@selector(shareWillStart) withObject:viewController waitUntilDone:YES];
            [request performRequestWithHandler:requestHandler];
        }
        else {
            //the handler does not run on the main thread
            [self performSelectorOnMainThread:@selector(twitterLoginFromViewController:) withObject:viewController waitUntilDone:YES];
        }
    };
    
    //ACAccountStore and TWTweetComposeViewController work differently on iOS 5+ and iOS 6+
    if ([accountStore respondsToSelector:@selector(requestAccessToAccountsWithType:options:completion:)]) { //iOS 6.0 and 6.1
        [accountStore requestAccessToAccountsWithType:twitterType
                                              options:NULL
                                           completion:accountStoreHandler];
    } else { //iOS 5.0 and iOS 5.1, remember: for these version Twitter login works only on device! not on simulator!
        if (![TWTweetComposeViewController canSendTweet]) {
            [self twitterLoginFromViewController:viewController];
        } else {
            [accountStore requestAccessToAccountsWithType:twitterType withCompletionHandler:accountStoreHandler];
        }
    }
}


- (void)postLinkFromViewController:(UIViewController *)viewController {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 5.1) { //iOS 6.0 and 6.1 and so forth
        [self postLinkForIos6WithViewController:viewController];
    } else {
        [self postLinkForIos5WithViewController:viewController];
    }
}


- (void)postLinkForIos5WithViewController:(UIViewController *)viewController {
    TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController  alloc] init];
    
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
        switch(result) {
            case SLComposeViewControllerResultCancelled:
                break;
            case SLComposeViewControllerResultDone:
                break;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [viewController dismissViewControllerAnimated:NO completion:^{
            }];
        });
    };
    
    [tweetSheet setInitialText:[NSString stringWithFormat:NSLocalizedString(@"EZSpreadTheLoveTwitterText", @"Check out Slidely Video app by @Slidely, it's the awesomest way to create music videos on your iPhone!"), @""]];
    
    /*
    if (![tweetSheet addImage:[UIImage imageNamed:@"larry.png"]]) {
        NSLog(@"Unable to add the image!");
    }
     */
    if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
        
    }
    
    [viewController presentViewController:tweetSheet animated:NO completion:^{
        
    }];
}


- (void)postLinkForIos6WithViewController:(UIViewController *)viewController {
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
        switch(result) {
            case SLComposeViewControllerResultCancelled:
                break;
            case SLComposeViewControllerResultDone:
                break;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [viewController dismissViewControllerAnimated:NO completion:^{
            }];
        });
    };
    
    [tweetSheet setInitialText:[NSString stringWithFormat:NSLocalizedString(@"EZSpreadTheLoveTwitterText", @"Check out Slidely Video app by @Slidely, it's the awesomest way to create music videos on your iPhone!"), @""]];
    
    /*
    if (![tweetSheet addImage:[UIImage imageNamed:@"larry.png"]]) {
        NSLog(@"Unable to add the image!");
    }
     */
    if (![tweetSheet addURL:[NSURL URLWithString:@"http://twitter.com/"]]){
    }
    
    [viewController presentViewController:tweetSheet animated:NO completion:^{
    }];
}


- (void)twitterLoginFromViewController:(UIViewController *)viewController {
    TWTweetComposeViewController *controllerSLC = [[TWTweetComposeViewController  alloc] init];
    controllerSLC.view.hidden = YES;
    [viewController presentModalViewController:controllerSLC animated:YES];
}


/* this method makes a seamless follow to the twitter page */
/*
- (void)followPage {
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [accountStore requestAccessToAccountsWithType:accountType withCompletionHandler:^(BOOL granted, NSError *error) {
        if(granted) {
            NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];
            
            if ([accountsArray count] > 0) {
                ACAccount *twitterAccount = [accountsArray objectAtIndex:0];
                
                NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
                [tempDict setValue:@"Slidely" forKey:@"screen_name"];
                [tempDict setValue:@"true" forKey:@"follow"];
                
                TWRequest *postRequest = [[TWRequest alloc] initWithURL:[NSURL URLWithString:@"https://api.twitter.com/1/friendships/create.json"]
                                                             parameters:tempDict
                                                          requestMethod:TWRequestMethodPOST];
                
                
                [postRequest setAccount:twitterAccount];
                
                [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    NSString *output = [NSString stringWithFormat:@"HTTP response status: %i", [urlResponse statusCode]];
                    NSLog(@"%@", output);
                    if (urlResponse.statusCode == 200)
                    {
                        UIAlertView *statusOK = [[UIAlertView alloc]
                                                 initWithTitle:@"Thank you for Following!"
                                                 message:@"You are now following us on Twitter!"
                                                 delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
//                        dispatch_async(dispatch_get_main_queue(), ^{
//                            [statusOK show];
//                        });
                    }
                }];
            }
        }
    }];
}
 */

@end
