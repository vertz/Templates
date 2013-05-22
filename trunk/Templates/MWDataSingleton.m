//
//  MWDataSingleton.m
//  Templates
//
//  Created by asaf vertz on 5/22/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWDataSingleton.h"

@implementation MWDataSingleton

#pragma mark - singleton

static MWDataSingleton* _instance = nil;

+(MWDataSingleton *) sharedInstance
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

-(void)initData
{
    if(_tableData != nil)
    {
        return;
    }
    
    NSDictionary* dict1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"batman.jpg", @"image",
                           @"BATMAN", @"title",
                           @"Beam me up, Scotty", @"text",
                           nil];
            
    NSDictionary* dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"superman.jpg", @"image",
                           @"SUPERMAN", @"title",
                           @"Up, up and away", @"text",
                           nil];
    
    NSDictionary* dict3 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"flash.jpg", @"image",
                           @"FLASH", @"title",
                           @"who knows...", @"text",
                           nil];
    
    NSDictionary* dict4 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"wonderwomen.jpg", @"image",
                           @"WONDERWOMEM", @"title",
                           @"who knows...", @"text",
                           nil];
    
    NSDictionary* dict5 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"hulk.jpg", @"image",
                           @"HULK", @"title",
                           @"HULK SMASH", @"text",
                           nil];
    
    _tableData = [[NSMutableArray alloc] initWithObjects:
                  dict1,
                  dict2,
                  dict3,
                  dict4,
                  dict5,
                  nil];
    
    SBJsonWriter* writer = [[SBJsonWriter alloc] init];
    NSString* jsonCommand = [writer stringWithObject:_tableData];
    
    Log(@"\n\nJSON\n%@\n\n",jsonCommand);
}

-(NSUInteger)count
{
    if(_tableData == nil)
    {
        return 0;
    }
    
    return [_tableData count];
}

-(NSDictionary*)objectAtIndex:(NSInteger)index
{
    if(_tableData == nil)
    {
        [self initData];
    }
    
    if(_tableData == nil || index < 0 || index >= [_tableData count])
    {
        LogError(@"_tableData == nil || index < 0 || index >= [_tableData count]");
        return nil;
    }
    
    return (NSDictionary*)[_tableData objectAtIndex:index];
}

@end
