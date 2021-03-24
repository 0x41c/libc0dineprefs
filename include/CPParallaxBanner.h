/*
 *   Copyright (c) 2021 c0dine
 *   All rights reserved.
 *   Feel free to contribute!
 */

#import <UIKit/UIKit.h>

#import <CPrefs/CPParallaxBannerAsset.h>


@interface CPParallaxBanner : UIView
@property (nonatomic, retain) NSString *bundleName;
@property (nonatomic, retain) NSString *bundlePath;
@property (nonatomic, assign) BOOL particles;

@property (nonatomic, retain) NSArray<UIImage *> *assets;

- (id) initWithFrame:(CGRect)frame bundleName:(NSString *)bundleName;
- (void) addParallaxImageNamed:(NSString *)name withEffectType:(CPParallaxType)effectType;
- (void) validateImageWithName:(NSString *)path completion:(void(^)(BOOL exists, BOOL isDirectory))completion;
@end