//
//  NSDate(TM).h
//  TranzMate
//
//  Created by Development on 9/29/11.
//  Copyright 2011 GuidingVoices. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate(TM)

+(NSDate*)dateFromJsonString:(NSString*)json;
+(NSDate*)dateFromLocalJsonString:(NSString*)json;
-(NSString*)formatDateTimeForJSON;
-(NSString*)formatLocalDateTimeForJSON;
-(NSString*)formatDateForJSON;
-(NSString*)formatShortDateTM;
-(NSString*)formatShortTimeTM;
-(NSString*)formatDateTimeTM;
-(NSString*)formatLocalDateTimeTM;

+(void)cleanStaticStuff;

-(BOOL)isSameDayWith:(NSDate*)otherDate;

@end
