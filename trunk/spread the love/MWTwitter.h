//
//  TMTwitter.h
//  TranzMate
//
//  Created by Vadim Fainshtein on 12/4/12.
//  Copyright (c) 2012 TranzMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWSocial.h"

@interface MWTwitter : MWSocial

- (void)postImageFromViewController:(UIViewController *)viewController;
- (void)postLinkFromViewController:(UIViewController *)viewController;

@end
