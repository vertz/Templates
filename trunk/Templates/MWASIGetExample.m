//
//  MWASIGetExample.m
//  Templates
//
//  Created by asaf vertz on 5/19/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWASIGetExample.h"

@implementation MWASIGetExample

-(void)requestExample
{
    // init parameters
    // in real life you will have them beforehand
    NSInteger userId = 353;
    NSString* autoToken = @"491b4cd1362bfb69";
    
    NSDictionary* parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                                                 [NSNumber numberWithInteger:userId], @"user_id",
                                                 autoToken, @"auth_token",
                                                 nil];
    
    _url = [NSURL URLWithString:@"http://ios.server.vubooo.com:8080/vubooo-server/matches_lists"];
    
    [self sendRequest:parameters withType:ASIRequestTypeGet];
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    Log(@"fin\n\n %@",[request responseString]);
}

@end
