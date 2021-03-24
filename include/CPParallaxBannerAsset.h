/*
 *   Copyright (c) 2021 c0dine
 *   All rights reserved.
 *   Feel free to contribute!
 */

#import <UIKit/UIKit.h>

typedef enum CPParallaxTypeEnum : NSUInteger {
    CFParallaxNormalType,
    CFParallaxReversedType,
    CFParallaxDisabledType
} CPParallaxType;


@interface UIImage ()
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) CPParallaxType parallaxType;

+ (UIImage *) imageWithContentsOfFile:(NSString *)file withParallaxType:(CPParallaxType)parallaxType;
@end
