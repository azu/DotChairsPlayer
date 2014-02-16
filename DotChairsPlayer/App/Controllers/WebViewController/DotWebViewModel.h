//
// Created by azu on 2014/02/16.
//


#import <Foundation/Foundation.h>


@interface DotWebViewModel : NSObject
- (NSUInteger)numberOfURLs;

- (NSString *)filePathForIndex:(NSUInteger) index1;

- (void)setDownloadList:(NSArray *) array;

- (NSString *)fileNameForIndex:(NSUInteger) index1;
@end