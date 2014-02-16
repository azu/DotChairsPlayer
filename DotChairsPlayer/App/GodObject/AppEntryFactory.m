//
// Created by azu on 2014/02/03.
//


#import "AppEntryFactory.h"
#import "AppUITabBarController.h"
#import "iOSDetector.h"


@interface AppEntryFactory ()
@property(nonatomic, strong, readwrite) AppUITabBarController *appTabBarController;
@property(nonatomic, strong, readwrite) UINavigationController *mainNavigationController;
@property(nonatomic, strong, readwrite) UINavigationController *downloadedNavigationController;
@end

@implementation AppEntryFactory {

}


- (UIStoryboard *)storyBoardWithName:(NSString *) storyboardName {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[iOSDetector universalFile:storyboardName] bundle:nil];
    return storyboard;
}
#pragma mark - Tab

- (AppUITabBarController *)appTabBarController {
    if (_appTabBarController == nil) {
        _appTabBarController = [[self storyBoardWithName:@"HomeTab"] instantiateInitialViewController];
        _appTabBarController.appFactoryAdmin = self.appAdmin;
    }
    return _appTabBarController;
}

- (UINavigationController *)mainNavigationController {
    if (_mainNavigationController == nil) {
        _mainNavigationController = [[self storyBoardWithName:@"Main"] instantiateInitialViewController];
    }
    return _mainNavigationController;
}


- (UINavigationController *)downloadedNavigationController {
    if (_downloadedNavigationController == nil) {
        _downloadedNavigationController = [[self storyBoardWithName:@"DLList"] instantiateInitialViewController];
    }
    return _downloadedNavigationController;
}
@end