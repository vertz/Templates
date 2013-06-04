//
//  MWFBSession.m
//  Templates
//
//  Created by asaf vertz on 6/4/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWFBSession.h"

@implementation MWFBSession

#pragma mark - singleton

static MWFBSession* _instance = nil;

+(MWFBSession *) sharedInstance
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
	if (self != nil) {
        
    }
	return self;
}


- (id)copyWithZone:(NSZone *)zone
{
	return self;
}

#pragma mark - FB

@end
