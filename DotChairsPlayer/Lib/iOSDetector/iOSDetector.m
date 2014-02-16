//
// Created by azu on 2013/05/27.
//


#import "iOSDetector.h"


@implementation iOSDetector {

}
+ (BOOL)isPhone {
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

+ (BOOL)isPad {
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

+ (NSString *)universalFile:(NSString *) fileName {
    if ([self isPhone]) {
        return fileName;
    } else if ([self isPad]) {
        return [NSString stringWithFormat:@"%@~ipad", fileName];
    }
    return nil;
}

+ (BOOL)isJapanese {
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ja"]) {
        return YES;
    }
    return NO;
}
@end