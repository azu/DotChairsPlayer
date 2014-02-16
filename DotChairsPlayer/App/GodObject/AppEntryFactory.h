//
// Created by azu on 2014/02/03.
//


#import <Foundation/Foundation.h>

@class AppUITabBarController;
@class AppFactoryAdmin;

@interface AppEntryFactory : NSObject
@property(nonatomic, strong, readonly) AppUITabBarController *appTabBarController;
@property(nonatomic, strong, readonly) UINavigationController *mainNavigationController;
@property(nonatomic, strong, readonly) UINavigationController *downloadedNavigationController;

@property(nonatomic, weak) AppFactoryAdmin *appAdmin;
@end