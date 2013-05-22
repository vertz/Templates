//
//  SessionFacebook.h
//  UPad
//
//  Created by Ehud Epstein on 11/6/12.
//  Copyright (c) 2012 com.mobiwedo.upad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWSocial.h"
#import <Social/Social.h>

@interface MWFacebook : MWSocial {
    SLComposeViewController *mySLComposerSheet;
}

@property (nonatomic, retain) NSString* description;
@property (nonatomic) BOOL shouldPostSilently;

@end
