//
//  UIColor+Category.m
//  Spotify
//
//  Created by Gokhan Gultekin on 5.07.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

//a different approach we can use
+ (UIColor*) getColorFromRGBArray:(NSArray*)rgb {
    CGFloat red = [rgb[0] floatValue];
    CGFloat green = [rgb[1] floatValue];
    CGFloat blue = [rgb[2] floatValue];
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1.0];
}

//but It's more useful
+ (UIColor*) getColorFromRGB:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue {
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:1.0];
}


+ (UIColor*) tabBarTintColor {
    return [UIColor whiteColor];
}

+ (UIColor*) tabBarBarTintColor {
    return [self getColorFromRGB:40 withGreen:40 withBlue:40];
}

+ (UIColor*) navigationBarTintColor {
    return [UIColor whiteColor];
}

+ (UIColor*) navigationBarBarTintColor {
    return [self getColorFromRGB:25 withGreen:25 withBlue:25];
}

+ (UIColor*) viewBackgroundColor {
    return [self getColorFromRGB:18 withGreen:18 withBlue:18];
}

@end
