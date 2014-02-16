//
// Created by azu on 2014/02/16.
//


#import "DLModel.h"


@implementation DLModel {

}
- (instancetype)initWithFileName:(NSString *) fileName fileURL:(NSString *) fileURL {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    self.fileName = fileName;
    self.fileURL = fileURL;

    return self;
}

+ (instancetype)modelWithFileName:(NSString *) fileName fileURL:(NSString *) fileURL {
    return [[self alloc] initWithFileName:fileName fileURL:fileURL];
}

@end