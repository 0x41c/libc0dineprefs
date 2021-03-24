#import <CPrefs/CPParallaxBannerAsset.h>

@implementation UIImage ()
@synthesize name;
+ (UIImage *) imageWithContentsOfFile:(NSString *)path withParallaxType:(CPParallaxType)parallaxType {
    UIImage *image =  [UIImage imageWithContentsOfFile:path];
    
    return image;
}
@end