//
//  MWSimilarUser.h
//  vubooo
//
//  Created by asaf vertz on 12/19/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSimilarUserNameKey @"name"
#define kSimilarUserIdKey @"id"
#define kSimilarUserImageKey @"image_url"
#define kSimilarUserIsFollowingKey @"is_following"

@interface MWSimilarUser : NSObject
{
    
}

@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* imageUrl;
@property (nonatomic) int userId;
@property (nonatomic) BOOL isFollowing;

+(MWSimilarUser*)similarUserFromDictionary : (NSDictionary*)dict;
- (id)copyWithZone:(NSZone *)zone;

@end
