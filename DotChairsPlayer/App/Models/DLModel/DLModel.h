//
// Created by azu on 2014/02/16.
//


#import <Foundation/Foundation.h>


@interface DLModel : NSObject
@property (nonatomic) NSString *directoryName;
@property (nonatomic) NSString *fileName;
@property (nonatomic) NSString *fileURL;

- (instancetype)initWithFileName:(NSString *) fileName fileURL:(NSString *) fileURL;

+ (instancetype)modelWithFileName:(NSString *) fileName fileURL:(NSString *) fileURL;

@end