//
//  MWConstants.m
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWConstants.h"

@implementation MWConstants

NSInteger const TableTemplateRowHeight = 70;

static MWConstants* _instance = nil;

+(MWConstants *) sharedInstance
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

@end
