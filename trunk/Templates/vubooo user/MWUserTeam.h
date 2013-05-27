//
//  MWUserTeam.h
//  vubooo
//
//  Created by asaf vertz on 12/18/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUserTeamNameKey @"name"
#define kUserTeamIdKey @"id"
#define kUserTeamInitialsKey @"initials"

@interface MWUserTeam : NSObject
{
    
    
}

@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* initials;
@property (nonatomic) int teamId;

+(MWUserTeam*)userTeamFromDictionary : (NSDictionary*)dict;
- (id)copyWithZone:(NSZone *)zone;

@end
