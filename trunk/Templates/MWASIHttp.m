//
//  MWASIHttp.m
//  Templates
//
//  Created by asaf vertz on 5/19/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import "MWASIHttp.h"

@implementation MWASIHttp

#pragma mark - send ASIHTTPRequest

-(void)sendRequest:(NSDictionary*)values withType:(ASIRequestType)type
{
    LogEnter();
    
    if (![[MWSession sharedInstance] isNetworkAvailable])
    {
        LogError(@"network unavilable");
        return;
    }
    
    if(_url == nil)
    {
        LogError(@"url is nil");
        return;
    }
    
    switch (type)
    {
        case ASIRequestTypeGet:
        {
            [self requestGET:values];
            
            _asiRequest = [ASIFormDataRequest requestWithURL:_getUrl];
            
            [_asiRequest addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
            [_asiRequest setRequestMethod:@"GET"];
            
            break;
        }
            
        case ASIRequestTypePost:
        {
            [self requestPOST:values];
            
            _asiRequest = [ASIFormDataRequest requestWithURL:_url];
            
            [_asiRequest addRequestHeader:@"Content-Type" value:@"application/json"];
            [_asiRequest setRequestMethod:@"POST"];
            
            break;
        }
            
        default:
            LogError(@"wrong type (type is %d)",type);
            return;
    }
    
    if(_useCache)
    {
        [_asiRequest setDownloadCache:[ASIDownloadCache sharedCache]];
        [_asiRequest setCachePolicy:cachePolices];
    }
    
    [_asiRequest setShouldAttemptPersistentConnection:NO];
    [_asiRequest setDelegate:self];
    
    [_asiRequest startAsynchronous];
    
    LogExit();
}

-(void)requestPOST:(NSDictionary*)dict
{
    for (NSString* key in dict)
    {
        [_asiRequest setPostValue:[dict objectForKey:key]  forKey:key];
    }
}

-(void)requestGET:(NSDictionary*)dict
{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"?"];
    
    for (NSString* key in dict)
    {
        [str appendFormat:@"%@=%@&",key,[dict objectForKey:key]];
    }
    
    NSString* requestParametersString = [str substringWithRange:NSMakeRange(0, [str length]-1)];
    
    _getUrl = [[NSURL alloc] initWithString:requestParametersString relativeToURL:_url];
    //_getUrl = [NSURL in:requestParametersString relativeToURL:_url];
    
    Log(@"\n\n%@\n\n",_getUrl);
}

#pragma mark - ASIHTTPRequest delegate

-(void)requestStarted:(ASIHTTPRequest *)request
{
    Log();
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    Log();
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    LogErrorObject([request error]);
    
    if (_delegate != nil)
    {
        [_delegate asiRequestFailed];
    }
}

#pragma mark - fin

-(void)dealloc
{
    if(_asiRequest != nil)
    {
        [_asiRequest clearDelegatesAndCancel];
    }
    
    [self setDelegate:nil];
}

@end
