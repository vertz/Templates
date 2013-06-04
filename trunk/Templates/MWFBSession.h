//
//  MWFBSession.h
//  Templates
//
//  Created by asaf vertz on 6/4/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface MWFBSession : NSObject
{
    
}

@property (nonatomic ,strong) FBSession *session;


+(MWFBSession *) sharedInstance;

@end
