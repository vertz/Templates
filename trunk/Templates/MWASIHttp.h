//
//  MWASIHttp.h
//  Templates
//
//  Created by asaf vertz on 5/19/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "ASIHTTPRequest.h"

#import "MWSession.h"

#define cachePolices ASIAskServerIfModifiedCachePolicy | ASIFallbackToCacheIfLoadFailsCachePolicy

typedef enum{
    ASIRequestTypeGet,
    ASIRequestTypePost
}ASIRequestType;

@protocol MWASIHttpDelegate <NSObject>

-(void)asiRequestFailed;

@end

@interface MWASIHttp : NSObject <ASIHTTPRequestDelegate>
{
    ASIFormDataRequest *_asiRequest;
    
    NSURL* _url;
    NSURL* _getUrl;
}

@property (nonatomic, weak) id<MWASIHttpDelegate> delegate;

@property (nonatomic, assign) BOOL useCache;

-(void)sendRequest:(NSDictionary*)values withType:(ASIRequestType)type;

@end
