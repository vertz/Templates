//
//  MWDataSingleton.h
//  Templates
//
//  Created by asaf vertz on 5/22/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SBJson.h"

@interface MWDataSingleton : NSObject
{
    NSMutableArray* _tableData;
}

+(MWDataSingleton *) sharedInstance;

-(void)initData;
-(NSUInteger)count;
-(NSDictionary*)objectAtIndex:(NSInteger)index;

@end
