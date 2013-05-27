//
//  MWUserData.h
//  Templates
//
//  Created by asaf vertz on 5/27/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KUserDataAgeKey             @"KUserDataAgeKey"
#define KUserDataNameKey            @"KUserDataNameKey"
#define KUserDataArrayCountKey      @"KUserDataArrayCountKey"
#define KUserDataArrayKey           @"KUserDataArrayKey"

@interface MWUserData : NSObject <NSCoding>
{
    NSMutableArray* _dataArray;
}

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) NSString* name;

+(MWUserData *) sharedInstance;

- (void)saveCustomObject;
- (void)loadCustomObject;

@end
