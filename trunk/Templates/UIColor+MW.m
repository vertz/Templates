//
//  UIColor+MW.m
//  vubooo
//
//  Created by Vadim Fainshtein on 2/5/13.
//  Copyright (c) 2013 vertz. All rights reserved.
//

#import "UIColor+MW.h"

@implementation UIColor (MW)


+ (UIColor *)colorWithHex:(NSUInteger) rgb
{
    return [UIColor colorWithRed:(rgb >> 16) / 255.0f green:(0xff & ( rgb >> 8)) / 255.0f blue:(0xff & rgb) / 255.0f alpha:1.0];
}

@end
