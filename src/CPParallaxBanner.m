#import <CPrefs/CPParallaxBanner.h>


@implementation CPParallaxBanner
- (id) initWithFrame:(CGRect)frame bundleName:(NSString *)name {
   self = [super initWithFrame:frame];

   self.bundleName = name;
   self.bundlePath = [NSString stringWithFormat:@"/Library/PreferenceBundles/%@.bundle/banner/", self.bundleName];
   BOOL isDir;
   BOOL pathExists = [[NSFileManager defaultManager] fileExistsAtPath:self.bundlePath isDirectory:&isDir];
   if (!pathExists && isDir) {
      [NSException raise:@"Banner asset folder path invalid!" format:@"Banner asset path %@ non-existent", self.bundlePath];
      return nil;
   }
   return self;
}


- (void) addParallaxImageNamed:(NSString *)name withEffectType:(CPParallaxType)effectType {
   [self validateImageWithName:name completion:^(BOOL exists, BOOL isDirectory) {
      if (exists) {
         if (isDirectory) {
            [NSException raise:@"Banner asset invalid!" format:@"Banner asset \"%@\" is a directory!", name];
            return;
         }
      } else {
         [NSException raise:@"Banner asset invalid!" format:@"Banner asset \"%@\" non-existent", name];
         return;
      }
   }];

}

- (void) validateImageWithName:(NSString *)name completion:(void(^)(BOOL exists, BOOL isDirectory))completion {
   BOOL isDir;
   BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:[self.bundlePath stringByAppendingString:[name stringByAppendingString:@".png"]] isDirectory:&isDir];
   completion(exists, isDir);
}

- (UIImage *) imageWithContentsOfFile:(NSString *)path withParallaxType:(CPParallaxType)parallaxType {
    UIImage *image =  [UIImage imageWithContentsOfFile:path];
    
    return image;
}

@end