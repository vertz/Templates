//
//  MWUserTeam.m
//  vubooo
//
//  Created by asaf vertz on 12/18/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import "MWUserTeam.h"

@implementation MWUserTeam

+(MWUserTeam*)userTeamFromDictionary : (NSDictionary*)dict
{
    
    MWUserTeam* userTeam = [[MWUserTeam alloc]init];
    
    NSString* str = [dict objectForKey:kUserTeamNameKey];
    if(str){
        userTeam.name = str;
    }
    else{
        LogError(@"name is nil");
    }
    
    str = [dict objectForKey:kUserTeamInitialsKey];
    if(str){
        userTeam.initials = str;
    }
    else{
        LogError(@"initials is nil");
    }
    
    NSNumber* number = [dict objectForKey:kUserTeamIdKey];
    if(number){
        userTeam.teamId = number.integerValue;
    }
    else{
        LogError(@"teamId is nil");
    }
    
    return userTeam;
}

- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    
    if (copy)
    {
        // Copy NSObject subclasses
        [copy setName:[self.name copyWithZone:zone]];
        [copy setInitials:[self.initials copyWithZone:zone]];
        
        // Set primitives
        [copy setTeamId:self.teamId];
    }
    
    return copy;
}

@end
