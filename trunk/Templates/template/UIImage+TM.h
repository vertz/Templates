//
//  UIImage+TM.h
//  TranzMate
//
//  Created by Ariel Tkachenko on 5/20/12.
//  Copyright (c) 2012 GuidingVoices. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TM)

- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end
