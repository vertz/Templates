//
//  MWUserData.m
//  Templates
//
//  Created by asaf vertz on 5/27/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWUserData.h"

@implementation MWUserData  

#pragma mark - singleton

static MWUserData* _instance = nil;

+(MWUserData *) sharedInstance
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
        
    }
	return self;
}


- (id)copyWithZone:(NSZone *)zone
{
	return self;
}

#pragma mark - data

- (void)saveCustomObject
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:_age forKey:KUserDataAgeKey];
    [defaults setObject:_name forKey:KUserDataNameKey];
    
    [defaults synchronize];
}

- (void)loadCustomObject
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _age =  [defaults integerForKey:KUserDataAgeKey];
    _name = [defaults objectForKey:KUserDataNameKey];
}

#pragma mark - NSCoding

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:_age forKey:KUserDataAgeKey];
    [encoder encodeObject:_name forKey:KUserDataNameKey];
}

-(id)initWithCoder:(NSCoder *)encoder
{
    self = [super init];
    
	if(self)
    {
        _age =  [encoder decodeIntegerForKey:KUserDataAgeKey];
        _name = [encoder decodeObjectForKey:KUserDataNameKey];
	}
    
	return self;
}

@end
