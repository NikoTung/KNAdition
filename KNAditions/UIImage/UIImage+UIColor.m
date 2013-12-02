//
//  UIImage+UIColor.m
//  KNAdition
//
//  Created by NikoTung on 12/2/13.
//  Copyright (c) 2013 Niko. All rights reserved.
//

#import "UIImage+UIColor.h"

@implementation UIColor(UIImage)

- (UIImage *)getImage
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
