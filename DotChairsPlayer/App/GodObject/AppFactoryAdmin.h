//
// Created by azu on 2014/02/03.
//


#import <Foundation/Foundation.h>

@class AppEntryFactory;


@interface AppFactoryAdmin : NSObject

- (instancetype)initWithAppFactory:(AppEntryFactory *)aFactory;
@property(readonly) AppEntryFactory *factory;

- (void)launchInWindow:(UIWindow *)aWindow;

@end