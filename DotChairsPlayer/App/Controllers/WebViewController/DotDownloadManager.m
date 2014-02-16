//
// Created by azu on 2014/02/16.
//


#import "DotDownloadManager.h"


@implementation DotDownloadManager {

}
#pragma mark - Singleton methods

static DotDownloadManager *_sharedManager = nil;

- (NSString *)directory {
    NSString *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
        NSUserDomainMask, YES)[0];
    return documentsDirectory;
}

- (id)init {
    self = [super initWithLocalPathFolder:self.directory];
    if (self == nil) {
        return nil;
    }
    return self;
}

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (instancetype)copyWithZone:(NSZone *) zone {
    return self;
}
@end