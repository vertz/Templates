//
//  TMSocial.h
//  TranzMate
//
//  Created by Vadim Fainshtein on 12/4/12.
//  Copyright (c) 2012 TranzMate. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultLink @"http://easyhi.com/"
#define  kDefaultName @""
#define kDefaultImageURL  @""
#define kDefaultImage [UIImage imageNamed:@""]

#define facebookLogoutNotification @"facebookLogoutNotification"
#define facebookLoginNotification @"facebookLoginNotification"

#define facebookPostedSuccessfully @"facebookPostedSuccessfully"
#define facebookPostedWithFailure @"facebookPostedWithFailure"

#define twitterLogoutNotification @"twitterLogoutNotification"
#define twitterLoginNotification @"twitterLoginNotification"

#define twitterPostedSuccessfully @"twitterPostedSuccessfully"
#define twitterPostedWithFailure @"twitterPostedWithFailure"

@protocol ImagesSharing <NSObject>

- (void)shareWillStart;
- (void)imagesSharedSuccessfully:(BOOL)successfully;

@end

@interface MWSocial : NSObject {
    id<ImagesSharing> delegate;
}

-(id)initWithDelegate:(id<ImagesSharing>)aDelegate;
- (void)postWithAllowLogin:(BOOL)allowLogin;
- (void)finish:(NSNumber *)isSuccess;
- (void)finishSharing:(BOOL)isSuccess;

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* link;
@property (nonatomic, retain) NSString* userMessage;
@property (nonatomic, retain) NSString* imageURL;
@property (nonatomic, retain) UIImage* image;
@property (nonatomic, retain) UIViewController* parentController;

@end
