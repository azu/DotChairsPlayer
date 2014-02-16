//
// Created by azu on 2014/02/16.
//


#import <Asterism/ASTMap.h>
#import "DLViewTableViewModel.h"


@interface DLViewTableViewModel ()
@property(nonatomic, strong) NSArray *fileArray;
@end

@implementation DLViewTableViewModel {

}


- (void)reloadData {

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *document = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:[document path] error:nil];
    self.fileArray = ASTMap(fileList, ^id(NSString *obj) {
        return [document URLByAppendingPathComponent:obj];
    });

}

- (NSInteger)numberOfData {
    return [self.fileArray count];
}

- (NSString *)fileNameAtIndexPath:(NSIndexPath *) path {
    NSURL *fileURL = self.fileArray[(NSUInteger)path.row];
    return [fileURL lastPathComponent];
}

- (NSURL *)filePathURLAtIndexPath:(NSIndexPath *) path {
    return self.fileArray[(NSUInteger)path.row];
}

- (void)deleteFileAtIndexPath:(NSIndexPath *) path {

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *fileURL = self.fileArray[(NSUInteger)path.row];
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
@end