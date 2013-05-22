//
//  TMSocial.m
//  TranzMate
//
//  Created by Vadim Fainshtein on 12/4/12.
//  Copyright (c) 2012 TranzMate. All rights reserved.
//

#import "MWSocial.h"


@implementation MWSocial

-(id)initWithDelegate:(id<ImagesSharing>)aDelegate {
	self = [super init];
	if (self != nil) {
        _name = nil;
        _image = nil;
        _imageURL = nil;
        _link = nil;
        _userMessage = nil;
        delegate = aDelegate;
    }
	return self;
}

- (void)postWithAllowLogin:(BOOL)allowLogin {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}


- (void)finish:(NSNumber *)isSuccess {
    [self finishSharing:[isSuccess boolValue]];
    
}


- (void)finishSharing:(BOOL)isSuccess {
    if (delegate && [delegate respondsToSelector:@selector(imagesSharedSuccessfully:)]) {
        [delegate imagesSharedSuccessfully:isSuccess];
    }
}

@end
