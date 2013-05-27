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
    
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:_dataArray];
    [defaults setObject:myEncodedObject forKey:KUserDataArrayKey];
    
    [defaults setInteger:_age forKey:KUserDataAgeKey];
    [defaults setObject:_name forKey:KUserDataNameKey];
    
    [defaults synchronize];
}

- (void)loadCustomObject
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _age =  [defaults integerForKey:KUserDataAgeKey];
    _name = [defaults objectForKey:KUserDataNameKey];
    
    NSData *myEncodedObject = [defaults objectForKey:KUserDataArrayKey];
    if (myEncodedObject != nil)
    {
        NSArray *oldSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
        if (oldSavedArray != nil){
            _dataArray = [[NSMutableArray alloc] initWithArray:oldSavedArray];
        }
        else{
            _dataArray = [[NSMutableArray alloc] init];
        }
    }
    else
    {
        LogError(@"couldn't load _dataArray");
        _dataArray = [[NSMutableArray alloc] init];
    }
}

#pragma mark - NSCoding

-(void)encodeWithCoder:(NSCoder *)encoder
{
    char* c = "@";
    [encoder encodeInteger:[_dataArray count] forKey:KUserDataArrayCountKey];
    [encoder encodeArrayOfObjCType:c count:[_dataArray count] at:&_dataArray];
    
    [encoder encodeInteger:_age forKey:KUserDataAgeKey];
    [encoder encodeObject:_name forKey:KUserDataNameKey];
}

-(id)initWithCoder:(NSCoder *)encoder
{
    self = [super init];
    
	if(self)
    {
        char* c = "@";
        if(_dataArray == nil)
        {
            _dataArray = [[NSMutableArray alloc] init];
        }
        NSInteger count = [encoder decodeIntForKey:KUserDataArrayCountKey];
        [encoder decodeArrayOfObjCType:c count:count at:&_dataArray];
        
        _age =  [encoder decodeIntegerForKey:KUserDataAgeKey];
        _name = [encoder decodeObjectForKey:KUserDataNameKey];
	}
    
	return self;
}

@end
