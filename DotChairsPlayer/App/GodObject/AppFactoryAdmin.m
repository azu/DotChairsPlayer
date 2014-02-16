//
// Created by azu on 2014/02/03.
//


#import "AppFactoryAdmin.h"
#import "AppEntryFactory.h"


@implementation AppFactoryAdmin {

}
- (instancetype)initWithAppFactory:(AppEntryFactory *) aFactory {
    if (self = [super init]) {
        _factory = aFactory;
        [_factory setAppAdmin:self];
    }
    return self;
}

- (void)launchInWindow:(UIWindow *) aWindow {
    [aWindow setRootViewController:(id)self.factory.appTabBarController];
    [aWindow makeKeyAndVisible];
}

@end