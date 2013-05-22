    //
    //  NSDate(TM).m
    //  TranzMate
    //
    //  Created by Development on 9/29/11.
    //  Copyright 2011 GuidingVoices. All rights reserved.
    //

#import "NSDate(TM).h"
#import "Three20/Three20.h"
#import "Globals.h"

#include <time.h>
#include <xlocale.h>

static NSTimeZone*  utcTimeZone = nil;
static NSLocale*    posixLocale = nil;

static NSDateFormatter* jsonToDate = nil;
static NSDateFormatter* jsonToLocalDate = nil;
static NSDateFormatter* dateTimeToString = nil;
static NSDateFormatter* localDateTimeToString = nil;
static NSDateFormatter* dateToString = nil;
static NSDateFormatter* dateToShortString = nil;

//NSLocale* TМCurrentLocale(){
//    NSString* lang = LocalizationGetLanguage();
//    return [[NSLocale alloc] initWithLocaleIdentifier:lang];
//}

#define kJsonDateTimeFormat @"yyyy-MM-dd'T'HH:mm:ss.SSS"
#define kJsonDateFormat     @"yyyy-MM-dd"
#define kJsonTimeFormat     @"HH:mm:ss"
#define kOLDShortDateFormat @"dd/MM/yy"
#define kUTC                @"UTC"

#define kServerDateTimeFormat   "%FT%T"
#define kMillisecondsFormat     @"SSS"
#define kShortTimeFormat        "%H:%M"
#define kDateTimeFormat         "%d/%m/%Y %H:%M"
#define kShortDateFormat        "%d/%m"

@implementation NSDate(TM)

+(NSDate*)dateFromJsonString:(NSString*)json{
    Log(@"Date to format: %@",json);
    if(nil == posixLocale){
        posixLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        assert(posixLocale != nil);
    }
    if(utcTimeZone == nil){
        utcTimeZone = [NSTimeZone timeZoneWithName:kUTC];
    }
    if (nil == jsonToDate) {
        jsonToDate = [[NSDateFormatter alloc] init];
        [jsonToDate setTimeZone:utcTimeZone];
        [jsonToDate setLocale:posixLocale];
        jsonToDate.dateFormat = kJsonDateTimeFormat;
    }
    NSDate* result = nil;
    if([json isKindOfClass:[NSString class]]){
        result = [jsonToDate dateFromString:json];
    }else{
        if([json isKindOfClass:[NSNumber class]]){
            NSNumber* num = (NSNumber*)json;
            result = [NSDate dateWithTimeIntervalSince1970:num.longValue];
        }
    }
    Log(@"Resulting date: %@",[result description]);
    return result;
    
    
        //    if(!isValidString(json)){
        //        Log(@"Not a valid string");
        //        return nil;
        //    }
        //    Log(@"Date to format: %@",json);
        //    NSString* dateTime = [json substringWithRange:NSMakeRange(0, json.length-4)];
        //    NSString* milliseconds = [json substringWithRange:NSMakeRange(json.length-3, 3)];
        //    NSInteger mil = milliseconds.integerValue;
        //
        //    const char * formatString = kServerDateTimeFormat;
        //    struct tm sometime;
        //    strptime([dateTime UTF8String], formatString, & sometime);
        //    time_t time = mktime(& sometime)+mil;
        //    NSDate* date = [NSDate dateWithTimeIntervalSince1970: time];
        //
        //    Log(@"Resulting date: %@",[date description]);
        //    return date;
}


+(NSDate*)dateFromLocalJsonString:(NSString*)json{
    Log(@"Date to format: %@",json);
    if(nil == posixLocale){
        posixLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        assert(posixLocale != nil);
    }
    if (nil == jsonToLocalDate) {
        jsonToLocalDate = [[NSDateFormatter alloc] init];
        [jsonToLocalDate setLocale:posixLocale];
        
        jsonToLocalDate.dateFormat = kJsonDateTimeFormat;
    }
    NSDate* result = nil;
    if([json isKindOfClass:[NSString class]]){
        result = [jsonToLocalDate dateFromString:json];
    }else{
        if([json isKindOfClass:[NSNumber class]]){
            NSNumber* num = (NSNumber*)json;
            result = [NSDate dateWithTimeIntervalSince1970:num.longValue];
        }
    }
    Log(@"Resulting date: %@",[result description]);
    return result;
    
    
    
    
        //    if(!isValidString(json)){
        //        Log(@"Not a valid string");
        //        return nil;
        //    }
        //    Log(@"Date to format: %@",json);
        //    NSString* dateTime = [json substringWithRange:NSMakeRange(0, json.length-4)];
        //    NSString* milliseconds = [json substringWithRange:NSMakeRange(json.length-3, 3)];
        //    NSInteger mil = milliseconds.integerValue;
        //
        //    const char * formatString = kServerDateTimeFormat;
        //    struct tm sometime;
        //    strptime_l([dateTime UTF8String], formatString, & sometime, NULL);
        //    time_t time = mktime(& sometime)+mil;
        //    NSDate* date = [NSDate dateWithTimeIntervalSince1970: time];
        //
        //    Log(@"Resulting date: %@",[date description]);
        //    return date;
}

-(NSString*)formatDateTimeForJSON{
    Log(@"Date to format: %@",[self description]);
    if(nil == posixLocale){
        posixLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        assert(posixLocale != nil);
    }
    if(utcTimeZone == nil){
        utcTimeZone = [NSTimeZone timeZoneWithName:kUTC];
    }
    if (nil == dateTimeToString) {
        dateTimeToString = [[NSDateFormatter alloc] init];
        [dateTimeToString setLocale:posixLocale];
        [dateTimeToString setTimeZone:utcTimeZone];
        dateTimeToString.dateFormat = kJsonDateTimeFormat;
    }
    NSString* result = [dateTimeToString stringFromDate:self];
    Log(@"Formatted date: %@",result);
    return result;
    
    
        //
        //#ifdef DEBUG
        //    if (nil == dateTimeToString) {
        //        if(utcTimeZone == nil){
        //            utcTimeZone = [NSTimeZone timeZoneWithName:kUTC];
        //        }
        //        dateTimeToString = [[NSDateFormatter alloc] init];
        //        [dateTimeToString setTimeZone:utcTimeZone];
        //        dateTimeToString.dateFormat = kJsonDateTimeFormat;
        //    }
        //    Log(@"Date to format: %@",[dateTimeToString stringFromDate:self]);
        //#endif
        //    time_t time = [self timeIntervalSince1970];
        //    double dTime = [self timeIntervalSince1970];
        //    double fTime = floor(dTime);
        //    double dMil = (dTime - fTime) * 1000.0;
        //    int mil = (int)round(dMil);
        //
        //    struct tm timeStruct;
        //    gmtime_r(&time, &timeStruct);
        //    char buffer[80];
        //    strftime(buffer, 80, kServerDateTimeFormat, &timeStruct);
        //    NSString *dateStr = [[NSString stringWithCString:buffer encoding:NSASCIIStringEncoding]stringByAppendingFormat:@".%3d",mil];
        //    Log(@"Formatted date: %@",dateStr);
        //    return dateStr;
}

-(NSString*)formatLocalDateTimeForJSON{
#ifdef DEBUG
    if (nil == localDateTimeToString) {
        localDateTimeToString = [[NSDateFormatter alloc] init];
        localDateTimeToString.dateFormat = kJsonDateTimeFormat;
    }
    Log(@"Date to format: %@",[localDateTimeToString stringFromDate:self]);
#endif
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    
    time_t time = [self timeIntervalSince1970]+seconds;
    double dTime = [self timeIntervalSince1970];
    double fTime = floor(dTime);
    double dMil = (dTime - fTime) * 1000.0;
    int mil = (int)round(dMil);
    
    struct tm timeStruct;
    gmtime_r(&time, &timeStruct);
    char buffer[80];
    strftime(buffer, 80, kServerDateTimeFormat, &timeStruct);
    NSString *dateStr = [[NSString stringWithCString:buffer encoding:NSASCIIStringEncoding]stringByAppendingFormat:@".%3d",mil];
    Log(@"Formatted date: %@",dateStr);
    return dateStr;
}

-(NSString*)formatDateForJSON{
    if (nil == dateToString) {
        if(utcTimeZone == nil){
            utcTimeZone = [NSTimeZone timeZoneWithName:kUTC];
        }
        dateToString = [[NSDateFormatter alloc] init];
        [dateToString setTimeZone:utcTimeZone];
        dateToString.dateFormat = kJsonDateFormat;
    }
    return [dateToString stringFromDate:self];
}

-(NSString*)formatShortDateTM{
    if (nil == dateToShortString) {
        if(utcTimeZone == nil){
            utcTimeZone = [NSTimeZone timeZoneWithName:kUTC];
        }
        dateToShortString = [[NSDateFormatter alloc] init];
        [dateToShortString setTimeZone:utcTimeZone];
        dateToShortString.dateFormat = kOLDShortDateFormat;
    }
    return [dateToShortString stringFromDate:self];
}

-(NSString*)formatShortTimeTM{
#ifdef DEBUG
    static NSDateFormatter* formatter5 = nil;
    if (nil == formatter5) {
        formatter5 = [[NSDateFormatter alloc] init];
        formatter5.dateFormat = @"HH:mm";
        formatter5.locale = TTCurrentLocale();
    }
    Log(@"Time to format: %@", [formatter5 stringFromDate:self]);
#endif
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    
    time_t time = [self timeIntervalSince1970]+seconds;
    
    struct tm timeStruct;
    gmtime_r(&time, &timeStruct);
    char buffer[80];
    strftime(buffer, 80, kShortTimeFormat, &timeStruct);
    NSString *dateStr = [NSString stringWithCString:buffer encoding:NSASCIIStringEncoding];
    Log(@"Formatted time: %@",dateStr);
    return dateStr;
}

-(NSString*)formatDateTimeTM{
#ifdef DEBUG
    static NSDateFormatter* formatter8 = nil;
    if (nil == formatter8) {
        formatter8 = [[NSDateFormatter alloc] init];
        formatter8.dateFormat = @"dd/MM/yyyy HH:mm";
        formatter8.locale = TTCurrentLocale();
    }
    Log(@"Date to format: %@", [formatter8 stringFromDate:self] );
#endif
    
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    
    time_t time = [self timeIntervalSince1970]+seconds;
    
    struct tm timeStruct;
    gmtime_r(&time, &timeStruct);
    char buffer[80];
    strftime(buffer, 80, kDateTimeFormat, &timeStruct);
    NSString *dateStr = [NSString stringWithCString:buffer encoding:NSASCIIStringEncoding];
    Log(@"Formatted date: %@",dateStr);
    return dateStr;
}

-(NSString*)formatLocalDateTimeTM{
#ifdef DEBUG
    static NSDateFormatter* formatter9 = nil;
    if (nil == formatter9) {
        formatter9 = [[NSDateFormatter alloc] init];
        formatter9.dateFormat = @"dd/MM/yyyy HH:mm";
        formatter9.locale = TTCurrentLocale();
    }
    Log(@"Date to format: %@", [formatter9 stringFromDate:self] );
#endif
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    
    time_t time = [self timeIntervalSince1970]+seconds;
    
    struct tm timeStruct;
    gmtime_r(&time, &timeStruct);
    char buffer[80];
    strftime(buffer, 80, kDateTimeFormat, &timeStruct);
    NSString *dateStr = [NSString stringWithCString:buffer encoding:NSASCIIStringEncoding];
    Log(@"Formatted date: %@",dateStr);
    return dateStr;
}

+(void)cleanStaticStuff{
    utcTimeZone = nil;
    posixLocale = nil;
    
    jsonToDate = nil;
    jsonToLocalDate = nil;
    dateTimeToString = nil;
    localDateTimeToString = nil;
    dateToString = nil;
    dateToShortString = nil;
}

-(BOOL)isSameDayWith:(NSDate*)otherDate{
    NSCalendar *cal = [[NSCalendar alloc] init];
    NSDateComponents* selfComponents  = [cal components:0 fromDate:self];
    NSDateComponents* otherComponents = [cal components:0 fromDate:otherDate];
    
    return (([selfComponents year] == [otherComponents year]) && ([selfComponents month] == [otherComponents month]) && ([selfComponents day] == [otherComponents day]));
}

@end
