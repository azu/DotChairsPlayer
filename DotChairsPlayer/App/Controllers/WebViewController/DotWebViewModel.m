//
// Created by azu on 2014/02/16.
//


#import "DotWebViewModel.h"
#import "DLModel.h"
#import "ASTMap.h"
#import "DotIndexModel.h"
#import "HCYoutubeParser.h"


@interface DotWebViewModel ()
@property(nonatomic, strong) NSArray *downloadList;
@end

@implementation DotWebViewModel
- (NSUInteger)numberOfURLs {
    return [self.downloadList count];
}

- (NSString *)filePathForIndex:(NSUInteger) index1 {
    DLModel *dlModel = self.downloadList[index1];
    return dlModel.fileURL;
}

- (NSString *)fileNameForIndex:(NSUInteger) index1 {
    DLModel *dlModel = self.downloadList[index1];
    return dlModel.fileName;
}

- (NSString *)_sanitizeFileNameString:(NSString *) fileName {
    NSCharacterSet *illegalFileNameCharacters = [NSCharacterSet characterSetWithCharactersInString:@"/\\?%*|\"<>"];
    return [[fileName componentsSeparatedByCharactersInSet:illegalFileNameCharacters] componentsJoinedByString:@""];
}

- (void)setDownloadList:(NSArray *) array {
    _downloadList = ASTMap(array, ^id(DotIndexModel *obj) {
        DLModel *dlModel = [[DLModel alloc] init];
        dlModel.fileName = [[self _sanitizeFileNameString:obj.title] stringByAppendingPathExtension:@"mp4"];
        NSDictionary *videos = [HCYoutubeParser h264videosWithYoutubeID:obj.videoID];
        dlModel.fileURL = [videos objectForKey:@"hd720"];
        return dlModel;
    });
}

@end