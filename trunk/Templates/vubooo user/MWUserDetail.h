//
//  MWUserDetail.h
//  vubooo
//
//  Created by asaf vertz on 12/18/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWUserTeam.h"
#import "MWSimilarUser.h"
#import "MWConstants.h"

#define kUserNameKey @"name"
#define kUserIdKey @"id"
#define kUserImageKey @"image_url"
#define kUserVubooosKey @"vubooos"
#define kUserMatchesKey @"matches"
#define kUserFollowingKey @"following"
#define kUserFollowersKey @"followers"
#define kUserIsFollowingKey @"is_following"
#define kUserTeamsKey @"teams"
#define kUserSimilarUsersKey @"similar_users_to_follow"

@interface MWUserDetail : NSObject
{    
  NSMutableArray* _teamsArray;
  NSMutableArray* _similarUsersArray;
}

@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* imageUrl;
@property (nonatomic) int userId;
@property (nonatomic) int vubooos;
@property (nonatomic) int matches;
@property (nonatomic) int following;
@property (nonatomic) int followers;
@property (nonatomic) BOOL isFollowing;

+(MWUserDetail*)userFromDictionary : (NSDictionary*)dict;

-(void)addTeam:(MWUserTeam*)team;
-(void)addSimilarUser:(MWSimilarUser*)user;
-(id)objectAtIndex:(int)index ofType:(UserObjectType)type;
-(int)countType:(UserObjectType)type;
-(void)removeTeam:(MWUserTeam*)team;

@end
