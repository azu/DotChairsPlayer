//
// Created by azu on 2014/02/16.
//


#import "DLViewTableViewModel.h"


@interface DLViewTableViewModel ()
@property(nonatomic, strong) NSArray *fileList;
@property(nonatomic, strong, readwrite) NSURL *currentDirectory;
@end

@implementation DLViewTableViewModel {

}
- (void)reloadDataAtDirectoryURL:(NSURL *) url {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    self.currentDirectory = url;
    self.fileList = [fileManager contentsOfDirectoryAtPath:[self.currentDirectory path] error:nil];

}

- (void)reloadData {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (self.currentDirectory == nil) {
        self.currentDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    }
    self.fileList = [fileManager contentsOfDirectoryAtPath:[self.currentDirectory path] error:nil];
}

- (NSInteger)numberOfData {
    return [self.fileList count];
}

- (NSString *)fileNameAtIndexPath:(NSIndexPath *) path {
    NSURL *fileURL = [self filePathURLAtIndexPath:path];
    return [fileURL lastPathComponent];
}

- (NSURL *)filePathURLAtIndexPath:(NSIndexPath *) path {
    return [self.currentDirectory URLByAppendingPathComponent:self.fileList[(NSUInteger)path.row]];
}

- (void)deleteFileAtIndexPath:(NSIndexPath *) path {

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *fileURL = [self filePathURLAtIndexPath:path];
    NSError *error = nil;
    [fileManager removeItemAtURL:fileURL error:&error];
    if (error) {
        NSLog(@"error = %@", error);
    }

}

- (void)openWithVLCAtIndexPath:(NSIndexPath *) path {
    NSURL *url = [self filePathURLAtIndexPath:path];
    NSString *vlc = [NSString stringWithFormat:@"vlc://%@", url.absoluteString];
    NSURL *url1 = [NSURL URLWithString:vlc];
    if ([[UIApplication sharedApplication] canOpenURL:url1]) {
        [[UIApplication sharedApplication] openURL:url1];
    }

}

- (BOOL)fileIsDirectoryAtIndexPath:(NSIndexPath *) path {
    NSURL *url = [self filePathURLAtIndexPath:path];
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:[url path]
                                    isDirectory:&isDirectory];
    return isDirectory;
}


@end