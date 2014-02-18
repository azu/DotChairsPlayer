//
// Created by azu on 2014/02/16.
//



@interface DLViewTableViewModel : NSObject
@property(nonatomic, strong, readonly) NSURL *currentDirectory;

- (void)reloadData;

- (NSInteger)numberOfData;

- (NSString *)fileNameAtIndexPath:(NSIndexPath *) path;

- (NSURL *)filePathURLAtIndexPath:(NSIndexPath *) path;

- (void)deleteFileAtIndexPath:(NSIndexPath *) path;

- (void)openWithVLCAtIndexPath:(NSIndexPath *) path;

- (BOOL)fileIsDirectoryAtIndexPath:(NSIndexPath *) path;

- (void)reloadDataAtDirectoryURL:(NSURL *) url;
@end