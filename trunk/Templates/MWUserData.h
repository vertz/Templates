//
//  MWUserData.h
//  Templates
//
//  Created by asaf vertz on 5/27/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KUserDataAgeKey       @"KUserDataAgeKey"
#define KUserDataNameKey      @"KUserDataNameKey"

@interface MWUserData : NSObject <NSCoding>
{
    
}

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) NSString* name;

+(MWUserData *) sharedInstance;

- (void)saveCustomObject;
- (void)loadCustomObject;

@end
