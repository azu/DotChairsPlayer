//
// Created by azu on 2013/05/27.
//


#import <Foundation/Foundation.h>


@interface iOSDetector : NSObject

+ (BOOL)isPhone;

+ (BOOL)isPad;

+ (NSString *)universalFile:(NSString *) fileName;

+ (BOOL)isJapanese;
@end