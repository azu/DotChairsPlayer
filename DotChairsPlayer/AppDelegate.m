//
//  AppDelegate.m
//  DotChairsPlayer
//
//  Created by azu on 2014/02/16.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import "AppDelegate.h"
#import "AppEntryFactory.h"
#import "AppFactoryAdmin.h"

@interface AppDelegate ()
@property(nonatomic, strong) AppFactoryAdmin *appFactoryAdmin;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *) application didFinishLaunchingWithOptions:(NSDictionary *) launchOptions {

    [self.appFactoryAdmin launchInWindow:self.window];

    return YES;
}

- (AppFactoryAdmin *)appFactoryAdmin {
    if (_appFactoryAdmin == nil) {
        _appFactoryAdmin = [[AppFactoryAdmin alloc] initWithAppFactory:[AppEntryFactory new]];
    }
    return _appFactoryAdmin;
}

- (void)applicationWillResignActive:(UIApplication *) application {
}

- (void)applicationDidEnterBackground:(UIApplication *) application {

}

- (void)applicationWillEnterForeground:(UIApplication *) application {

}

- (void)applicationDidBecomeActive:(UIApplication *) application {

}

- (void)applicationWillTerminate:(UIApplication *) application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

}

@end