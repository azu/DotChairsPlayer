//
// Created by azu on 2014/02/16.
//



@interface DLViewTableViewModel : NSObject
- (void)reloadData;

- (NSInteger)numberOfData;

- (NSString *)fileNameAtIndexPath:(NSIndexPath *) path;

- (NSURL *)filePathURLAtIndexPath:(NSIndexPath *) path;

- (void)deleteFileAtIndexPath:(NSIndexPath *) path;
@end