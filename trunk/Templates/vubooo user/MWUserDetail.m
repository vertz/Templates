//
//  MWUserDetail.m
//  vubooo
//
//  Created by asaf vertz on 12/18/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import "MWUserDetail.h"

@implementation MWUserDetail

#define kUserNameKey @"name"
#define kUserIdKey @"id"
#define kUserImageKey @"image_url"
#define kUserVubooosKey @"vubooos"
#define kUserMatchesKey @"matches"
#define kUserFollowingKey @"following"
#define kUserFollowersKey @"followers"
#define kUserIsFollowingKey @"is_following"
#define kUserTeamsKey @"teams"

+(MWUserDetail*)userFromDictionary : (NSDictionary*)dict{
    
    LogEnter();
    
    MWUserDetail* user = [[MWUserDetail alloc]init];
    
    NSString* str = [dict objectForKey:kUserNameKey];
    
    if (str && str.length > 0) {
        const char *c = [str cStringUsingEncoding:NSISOLatin1StringEncoding];
        str = [[NSString alloc]initWithCString:c encoding:NSUTF8StringEncoding];
    }
    
    if(str){
        user.name = str;
    }
    else{
        LogError(@"name is nil");
    }
    
    str = [dict objectForKey:kUserImageKey];
    if(str){
        user.imageUrl = str;
    }
    else{
        LogError(@"imageUrl is nil");
    }
    
    user.isFollowing = [dict objectForKey:kUserIsFollowingKey];
    
    NSNumber* number = [dict objectForKey:kUserIdKey];
    if(number){
        user.userId = number.integerValue;
    }
    else{
        LogError(@"userId is nil");
    }
    
    number = [dict objectForKey:kUserVubooosKey];
    if(number){
        user.vubooos = number.integerValue;
    }
    else{
        LogError(@"vubooos is nil");
    }
    
    number = [dict objectForKey:kUserMatchesKey];
    if(number){
        user.matches = number.integerValue;
    }
    else{
        LogError(@"matches is nil");
    }
    
    number = [dict objectForKey:kUserFollowingKey];
    if(number){
        user.following = number.integerValue;
    }
    else{
        LogError(@"following is nil");
    }
    
    number = [dict objectForKey:kUserFollowersKey];
    if(number){
        user.followers = number.integerValue;
    }
    else{
        LogError(@"followers is nil");
    }
    
    id arr = [dict objectForKey:kUserTeamsKey];
    if(arr && [arr isKindOfClass: [NSArray class]]){
        
        MWUserTeam* team;
        
        for(NSDictionary* teamDict in arr){
            
            team = [MWUserTeam userTeamFromDictionary:teamDict];
            if(team){
                
                [user addTeam:team];
            }
            else{
                LogError(@"team is nil");
            }
        }
    }
    
    arr = [dict objectForKey:kUserSimilarUsersKey];
    if(arr && [arr isKindOfClass: [NSArray class]]){
        
        MWSimilarUser* similarUser;
        
        for(NSDictionary* similarUserDict in arr){
            
            similarUser = [MWSimilarUser similarUserFromDictionary:similarUserDict];
            if(similarUser){
                
                [user addSimilarUser:similarUser];
            }
            else{
                LogError(@"similarUser is nil");
            }
        }
    }
    
    LogExit(@"| countUserTeam = %d | countUserSimilarUser = %d",[user countType:UserTeam],[user countType:UserSimilarUser]);
    
    return user;
}

#pragma mark data

-(void)addTeam:(MWUserTeam*)team
{
    if(!_teamsArray){
        _teamsArray = [[NSMutableArray alloc]init];
    }
    
    if(team){
        [_teamsArray addObject:team];
    }
    else{
        LogError(@"team is nil");
    }
}


-(void)removeTeam:(MWUserTeam*)team
{
    if(team){
        [_teamsArray removeObject:team];
    }
    else{
        LogError(@"team is nil");
    }
}
-(void)addSimilarUser:(MWSimilarUser*)user
{
    if(!_similarUsersArray){
        _similarUsersArray = [[NSMutableArray alloc]init];
    }
    
    if(user){
        [_similarUsersArray addObject:user];
    }
    else{
        LogError(@"user is nil");
    }
}

-(id)objectAtIndex:(int)index ofType:(UserObjectType)type
{
    switch (type) {
        case UserTeam:
            if(index >= 0 && [_teamsArray count] > index && _teamsArray ){
                
                return [_teamsArray objectAtIndex:index];
            }
            else{
                
                LogError();
                return nil;
            }
            
        case UserSimilarUser:
            if(index >= 0 && [_similarUsersArray count] > index && _similarUsersArray ){
                
                return [_similarUsersArray objectAtIndex:index];
            }
            else{
                
                LogError();
                return nil;
            }
            
        default:
            LogError(@"invalid UserObjectType");
            return nil;
    }
}

-(int)countType:(UserObjectType)type
{
    switch (type) {
        case UserTeam:
            if(_teamsArray){
                return [_teamsArray count];
            }
            else{
                LogError(@"_teamsArray is nil");
                return 0;
            }
            
        case UserSimilarUser:
            if(_similarUsersArray){
                return [_similarUsersArray count];
            }
            else{
                LogError(@"_similarUsersArray is nil");
                return 0;
            }
            
        default:
            LogError(@"invalid UserObjectType");
            return 0;
    }    
}

@end
