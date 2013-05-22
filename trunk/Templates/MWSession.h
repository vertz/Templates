//
//  MWSession
//  vubooo
//
//  Created by asaf vertz on 1/3/13.
//  Copyright (c) 2013 vertz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWSession : NSObject
{
    BOOL _networkIsAvailable;
    
    UIAlertView* _alertRegisterError;
    UIAlertView* _alertFirstRequestError;
}


+(MWSession *) sharedInstance;

-(BOOL)isNetworkAvailable;


@end
