//
//  MWSimilarUser.m
//  vubooo
//
//  Created by asaf vertz on 12/19/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import "MWSimilarUser.h"

@implementation MWSimilarUser

+(MWSimilarUser*)similarUserFromDictionary : (NSDictionary*)dict
{
    
    MWSimilarUser* user = [[MWSimilarUser alloc]init];
    
    NSString* str = [dict objectForKey:kSimilarUserNameKey];
    
    if (str && str.length > 0) {
        const char *c = [str cStringUsingEncoding:NSISOLatin1StringEncoding];
        str = [[NSString alloc]initWithCString:c encoding:NSUTF8StringEncoding];        
    }
    
    if(str){
        user.name = str;
    } else{
        LogError(@"name is nil");
    }
    
    str = [dict objectForKey:kSimilarUserImageKey];
    if(str){
        user.imageUrl = str;
    }
    else{
        LogError(@"imageUrl is nil");
    }
    
    user.isFollowing = [dict objectForKey:kSimilarUserIsFollowingKey];
    /*
    if(str){
        
        if([str isEqualToString: @"true"]){
            
            user.isFollowing = YES;
        }
        else if ([str isEqualToString: @"false"]){
            
            user.isFollowing = NO;
        }
        else{
            LogError(@"isFollowing is invalid (%@)",str);
        }
    }
    else{
        LogError(@"isFollowing is nil");
    }
    */
    
    NSNumber* number = [dict objectForKey:kSimilarUserIdKey];
    if(number){
        user.userId = number.integerValue;
    }
    else{
        LogError(@"userId is nil");
    }
    
    return user;
}

- (id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    
    if (copy)
    {
        // Copy NSObject subclasses
        [copy setName:[self.name copyWithZone:zone]];
        [copy setImageUrl:[self.imageUrl copyWithZone:zone]];
        
        // Set primitives
        [copy setUserId:self.userId];
        [copy setIsFollowing:self.isFollowing];
    }
    
    return copy;
}

@end
