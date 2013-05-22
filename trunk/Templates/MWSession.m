//
//  MWSession
//  vubooo
//
//  Created by asaf vertz on 1/3/13.
//  Copyright (c) 2013 vertz. All rights reserved.
//

#import "MWSession.h"
#import "Reachability.h"

@implementation MWSession

#pragma mark singleton

static MWSession* _instance = nil;

+(MWSession*) sharedInstance
{
    @synchronized(self)
    {
        if(_instance == nil)
        {
            _instance = [[super allocWithZone:NULL]init];
        }
    }
    return _instance;
}

+(id)allocWithZone:(NSZone *)zone
{
	return [self sharedInstance];
}

-(id)init
{
	self = [super init];
	if (self != nil)
    {
        _networkIsAvailable = YES;
    }
	return self;
}


- (id)copyWithZone:(NSZone *)zone
{
	return self;
}

-(BOOL) isNetworkAvailable
{
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable)
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: NSLocalizedString(@"ttl_server_error",@"Network Error") message:NSLocalizedString(@"lbl_server_error",@"Network unavailable") delegate:self cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"btn_server_error_ok",@"OK"), nil];                
        
        if (_networkIsAvailable)
        {
            [alert show];
        }
        
        _networkIsAvailable = NO;
        return NO;
    }
    else
    {
        _networkIsAvailable = YES;       
        return YES;
    }    
}

@end
