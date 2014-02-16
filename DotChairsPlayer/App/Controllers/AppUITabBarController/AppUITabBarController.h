//
// Created by azu on 2014/02/03.
//


#import <Foundation/Foundation.h>

@class AppFactoryAdmin;

typedef NS_ENUM(NSUInteger, MenuTabType){
    MenuTab_Main,
    MenuTab_DLList,
};

@interface AppUITabBarController : UITabBarController

@property(weak) AppFactoryAdmin *appFactoryAdmin;
@end